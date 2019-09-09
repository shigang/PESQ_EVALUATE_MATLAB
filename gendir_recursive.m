function [xdir,xnum]=gendir_recursive(rootdirname,xdir,xnum,prefix1,pstr)
% 必须输入绝对路径
% usage example
% xdir=[];xnum=0;
% [xdir,xnum]=gendir_recursive(test_data_root_dir,xdir,xnum,'.wav','.WAV');

%if(nargin<5), prefix2=prefix1;end

addpath(rootdirname);
noisedining_dir=dir(rootdirname);
%noisedining_dir=noisedining_dir(3:end);
% noisedining_dir= noisedining_dir(randperm(length(noisedining_dir))); %打乱

for i=1:length(noisedining_dir)
    if ~strcmp(noisedining_dir(i).name,'.') && ~strcmp(noisedining_dir(i).name,'..')
        fulldir=[rootdirname filesep noisedining_dir(i).name];
        if(~isdir(fulldir))
            [a,b,c]=fileparts(fulldir);
            if(strcmp(c,prefix1)==1)
                if(strcmp(pstr,'blank')==1)
                    xnum=xnum+1;
                    xdir{xnum,1}=fulldir;
                    disp(fulldir);
                else
                    if strfind(fulldir,pstr)
                        xnum=xnum+1;
                        xdir{xnum,1}=fulldir;
                        disp(fulldir);
                    end
                end
                
            end
        elseif(isdir(fulldir))
            [xdir,xnum]=gendir_recursive(fulldir,xdir,xnum,prefix1,pstr);
        end
    end
end
end


