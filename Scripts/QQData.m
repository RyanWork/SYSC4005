% Iterate through the project folder
files = dir('./Project/*.dat');
numFiles = length(files);

% Create a directory to later save the images
if ~exist('SYSC4005QQ', 'dir')
    mkdir('SYSC4005QQ')
end

for i = 1:numFiles
    % Determine the path to the file
    file = files(i);
    fullPath = fullfile(file.folder, file.name);
    
    % Get the data in the file
    dataRead = importdata(fullPath);
   
    % Extract file name to save the figure name
    [path, baseFileName, ext] = fileparts(fullPath);
    
    % Create the histogram of the data
    expDist = makedist('Weibull');
    
    % Quick check to see if our index is 1
    % Cause Matlab is shit and it's not 0 based index
    if i ~= 1
        figure(i + 1);
    else
        figure(1);
    end
    % Create the QQ-Plot using the Exponential Distribution
    qqplot(dataRead, expDist);
    title(strcat(file.name, ' -- QQ Plot, Weibull'));
    ylabel('Time (min)')

    % Save the Exponential image to the SYSC4005QQ directory
    saveas(gcf, strcat('SYSC4005QQ/', baseFileName, 'QQ_Weibull.png'));
end