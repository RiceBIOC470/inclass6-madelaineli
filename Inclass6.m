%Inclass asssignment 6. 
function Inclass6()
one_a = name_age_grade({'Anne','Bob','Cici','Dylan','Emily'},[10,11,12,13,14],logical([1,0,1,0,1]));
disp('problem 1, part a')
disp(one_a)
one_b = average_age(one_a);
disp('problem 1, part b')
disp(one_b)

two_a = metadata('160611-AntiNodal-SD20x_f0003_w0002.tif');
disp('problem 2, part a')
disp(two_a)
two_b = actual_temp('160611-AntiNodal-SD20x_f0003_w0002.tif');
disp('problem 2, part b')
disp(two_b)
end

%1. a. Write a function which takes as inputs: a. a cell array of names. b.
% an array of numbers with the ages corresponding to the names, and c. a binary
% variable which is a P/F grade (true for pass) and returns a structure
% array called students with one structure storing this information for each student. 2. Write a
% function which takes your structure array of students as input and returns
% the average age of the students. 
function students = name_age_grade(name,age,grade)
age_cell = {};
grade_cell = {};
for ii = 1:5
    grade_cell{ii} = grade(ii);
    age_cell{ii} = age(ii);
end
students = struct('name',name,'age',age_cell,'grade',grade_cell);
end

function avr = average_age (students)
size_students = size(students);
for num = 1:size_students(2)
    age_array(num) = students(num).age;
end
avr = sum(age_array)/size_students(2);
end

%2. In this folder, you will find an immunofluorescence image of human stem
%cells stained for a gene called SOX2. Write a function which takes a
%filename as input and returns a structure containing metaData. Include at
%least the bitdepth, size, and date the image was taken. Do not include any
%information you do not understand. Hint: use the builtin function imfinfo
%b. Look at the field ImageDescription in the output of imfinfo - there is
%a lot of information here. Write code that gets the actual temperature
%from the camera out of this field. (Hint: it is preceded by the words
%"Actual Temperature" which don't appear anywhere else in
%ImageDescription).

function metaData = metadata(filename)
info = imfinfo(filename,'tif');
metaData = struct('Filename',info.Filename,'FileModDate',info.FileModDate,...
    'FileSize',info.FileSize,'Format',info.Format,'Width',info.Width,'Height',...
    info.Height,'BitDepth',info.BitDepth);
end

function temp = actual_temp(filename)
info = imfinfo(filename,'tif');
description = info.ImageDescription;
index = strfind(description,'Actual Temperature=');
pos = length('Actual Temperature=');
phrase = '';

%find the numbers after actual temperature
for ii = 0:5
    num = description(index+pos+ii);
    phrase = strcat(phrase,num);
    if ~isempty(str2num(phrase))
        temp = phrase;
    end
end
end
