function test_start( fileOrFolder, dispNoTest, topCall )    

    if( nargin < 1)
        fileOrFolder = [ fileparts(mfilename('fullpath')) '/'];
    end
    if( nargin < 2)
        dispNoTest = 0;
    end
    if( nargin < 3 )
        topCall = 1;
    end
    if(topCall)
        addpath(genpath(fileOrFolder));
    end

%    fprintf( '%s\n' , fileOrFolder );

    if( exist( fileOrFolder , 'dir' ) )

      if( ~isequal( fileOrFolder(end), '\' ) && ~isequal( fileOrFolder(end), '/' )     )
         if( isempty( strfind( fileOrFolder(end) , '\' )  ) )
            fileOrFolder = [ fileOrFolder '/' ];
         else
            fileOrFolder = [ fileOrFolder '\' ];
         end
      end

        curDir = dir( fileOrFolder );
        curDir = curDir(3:end); % remove . and .. folders

        N = numel( curDir );
        for i = 1:N
           test_start( [fileOrFolder curDir(i).name ] , dispNoTest, 0 );
        end

        return;

    end

	if( exist( fileOrFolder , 'file' ) )

        [ curPath , curFile, curExt] = fileparts( fileOrFolder );
        N = numel(curFile);

        if(~isequal(curFile, "test_start"))

            if( N>5 && isequal(curFile(1:5), 'test_' ) && isequal( curExt, '.m' )  )
    
              curSTR = sprintf('%s' , curFile );
              fprintf( curSTR );
              curFun = str2func( curFile );
              curFun();
              N = 40 - numel(curSTR);
              %fprintf( [ char(hex2dec('2713')) '\n'] )
              fprintf( [ repmat(' ', [1 N]) 'ok\n'] )
            else
                if( dispNoTest && isequal( curExt, '.m' ) && ~exist( [ curPath '/test_' curFile curExt  ] , 'file' )  )
                    fprintf( 'No test function for %s \n',  curFile );
                end
            end
        end
	end


end