% Iterate through the project folder
files = dir('./Project/*.dat');
numFiles = length(files);

% Create a directory to later save the images
if ~exist('SYSC4005Histograms', 'dir')
    mkdir('SYSC4005Histograms')
end

for i = 1:numFiles
    % Determine the path to the file
    file = files(i);
    fullPath = fullfile(file.folder, file.name);
    
    % Get the data in the file
    dataRead = importdata(fullPath);
   
    % Create the histogram of the data
    figure(i);
    histogram(dataRead);
    title(strcat(file.name, ' -- Histogram'));
    xlabel('Time Bins (min)');
    ylabel('Time (min)');
    
    % Extract file name to save the figure name
    [path, baseFileName, ext] = fileparts(fullPath);
    
    % Save the image to the SYSC4005Histograms directory
    saveas(gcf, strcat('SYSC4005Histograms/', baseFileName, '_Histogram.png'));
end