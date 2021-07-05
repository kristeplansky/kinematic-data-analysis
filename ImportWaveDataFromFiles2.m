function [positionalMatrixCellArray] = ImportWaveDataFromFiles2(filePath, mFolder, Task)
% ImportWaveDataFromFiles - Allows user to select files to be used in STI
% calculation. This function outputs the data from each file in a 1 X m
% cell array.
% Parameters: none
% Return value: positionalMatrixCellArray (1 x M cell array)
% Other functions: GetAllSensors
% Each cell contains a positional data matrix for each selected file

% command = sprintf('%s%s\\*%s*.wav',options.Path,SESid,Task);
command = sprintf('%s\\%s\\*%s*.tsv',filePath, mFolder, Task);
% SES - mfolder, options.Path - path, task - string for phrase

files=dir(command);


% [files,filePath] = uigetfile('*.tsv', 'Multiselect', 'on'); % UI to select files
positionalMatrixCellArray = cell(1, length(files)); % Initialize cell array

for iFile = 1:length(files)
    filename = files(iFile).name;
%     allSensors = GetAllSensors(filePath, filename, mFolder); % TTy TTz TTx TBy TBz TBx ULy ULz ULx LLy LLz LLx
    fullFilePath=sprintf('%s%s\\%s',filePath,mFolder,filename);
    tsvFile = importdata(fullFilePath); % Import full .tsv file
    allSensors = sensor_id(mFolder, tsvFile); % Assign sensor columns
    positionalMatrixCellArray{iFile} = allSensors; % Store each file in cell array
end

end % of ImportWaveDataFromFiles