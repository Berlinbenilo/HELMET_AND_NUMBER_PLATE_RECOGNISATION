load ('non.mat');

weeds=selectLabels(gTruth,'nonviolate');
addpath('train');
%%
trainingdata= objectDetectorTrainingData(weeds,...
    'WriteLocation','train');
detector2=trainACFObjectDetector(trainingdata);
save('plate1.mat','detector2');

rmpath('train');
