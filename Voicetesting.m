%%start record

recorder = audiorecorder(44100, 16, 1);

disp('Please record your voice');
drawnow();
pause(1);
recordblocking(recorder, 3);
play(recorder);
data = getaudiodata(recorder);
plot(data);
figure;

%Feauture extraction

f = Voiceft(data);

%% save data

db = input('Enter the user: ');

try
  load database
  F = [F;f];
  C = [C;db];
  save database
catch
  F = f;
  C = db;
  save database F C
end
disp('Your voice is registered');


