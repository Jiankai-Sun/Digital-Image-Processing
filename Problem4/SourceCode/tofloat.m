function [ out, revertClass ] = tofloat( inputImage )
%TOFLOAT 
    identify = @(x)x;
    tosingle = @im2single;
    table = {'uint8', tosingle, @im2uint8
             'uint16', tosingle, @im2uint16
             'logical', tosingle, @logical
             'double', identify, identify
             'single', identify, identify};
    classIndex = find(strcmp(class(inputImage), table(:, 1)));
    if isempty(classIndex)
        error('Unsupported Image Type');
    end
    out = table{classIndex, 2}(inputImage);
    revertClass = table{classIndex, 3};
end

