% Iterate through the project folder
files = dir('./Project/*.dat');
numFiles = length(files);

for i = 1:numFiles
    % Determine the path to the file
    file = files(i);
    fullPath = fullfile(file.folder, file.name);

    % Get the data in the file
    dataRead = importdata(fullPath);
    
    % Create a probability distribution with the data
    pd = fitdist(dataRead, 'Weibull');
    
    pd
    
    % Do a goodness-of-fit test
    chiTest = chi2gof(dataRead, 'CDF', pd);
    
    % Print some log of how it fits
    if chiTest == 0
        sprintf('%s: Fits', file.name)
    else
        sprintf('%s: Does not fit', file.name)
    end
   
end