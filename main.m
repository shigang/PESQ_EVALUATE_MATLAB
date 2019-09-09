

root_wav_path='data3';
% xdir_wav=[];xnum_wav=0;
% [xdir_wav,xnum_wav]=gendir_recursive(root_wav_path,xdir_wav,xnum_wav,'.wav','blank');
system('rm _pesq_itu_results.txt');
system('rm _pesq_results.txt');

clean_wav_name='p50mono';
noisy_wav_name='Airpodstest';
test_class_nums=7;

test_clean_name = [root_wav_path filesep clean_wav_name '.wav'];
for index=1:test_class_nums
    test_noisy_name = [root_wav_path filesep noisy_wav_name num2str(index) '.wav'];
    system(['./PESQ-UBUNTU ' test_clean_name ' ' test_noisy_name ' +16000']);
end