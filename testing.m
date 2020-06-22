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

%classify
load database
D= [];
for (i=1:size(F,1))
    d = sum(abs(F(i)-f));
    D = [D d];
end

%smallest distance
sm = inf;
ind = -1;

for (i=1:length(D))
    if (D(i) < sm)
      sm = D(i);
      ind = i;
    end
end
detected_class = C(ind);

disp('The detected class is : ');
detected_class

