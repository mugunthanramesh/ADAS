doTraining = false;
if ~doTraining && ~exist('yolov2ResNet50VehicleExample.mat','file')
    % Download pretrained detector.
    disp('Downloading pretrained detector (98 MB)...');
    pretrainedURL = 'https://www.mathworks.com/supportfiles/vision/data/yolov2ResNet50VehicleExample.mat';
    websave('yolov2ResNet50VehicleExample.mat',pretrainedURL);
end
% Unzip vehicle dataset images.
unzip vehicleDatasetImages.zip

% Load vehicle dataset ground truth.
data = load('vehicleDatasetGroundTruth.mat');
vehicleDataset = data.vehicleDataset;
vehicleDataset(1:4,:)
% Add the fullpath to the local vehicle data folder.
vehicleDataset.imageFilename = fullfile(pwd,vehicleDataset.imageFilename);

% Read one of the images.
I = imread(vehicleDataset.imageFilename{10});

% Insert the ROI labels.
I = insertShape(I,'Rectangle',vehicleDataset.vehicle{10});

% Resize and display image.
I = imresize(I,3);
imshow(I)