%% get file
load image.mat
%% classification
load violated.mat
ds= augmentedImageDatastore(imageSize,I);
imagefeature = activations(net, ds, featureLayer, ...
    'MiniBatchSize', 32, 'OutputAs', 'columns');
f1 = predict(classifier,imagefeature, 'ObservationsIn', 'columns');
pop_up = sprintf('%s',f1);
if strcmp(pop_up,'using phone') || strcmp(pop_up,'without helmet')
    load numberplate.mat
    b=rgb2gray(boxImage);
    v=im2bw(b);
    v=imcomplement(v);
    v=imclearborder(v);
    figure;
    imshow(v);
    [~,txt]= xlsread('address.xlsx');
    save c.mat txt
    [m,n]=size(txt);
    for i=1:m
        cell=txt{i,1};
        j=txt{i,2};
        if strcmp('TN03Y9488',cell)
           disp(j)
           s=sprintf('%s',cell);
           msgbox(s);
        end
    end
     mail = 'mugun26r@gmail.com';    %Your GMail email address
     password = '22244777';  
     setpref('Internet', 'E_mail', mail);  % sender "from" address, typically same as username, e.g. 'xyz@gmail.com'
     setpref('Internet', 'SMTP_Username', mail);
     setpref('Internet', 'SMTP_Password', password);
     setpref('Internet', 'SMTP_Server',   'smtp.gmail.com');
     props = java.lang.System.getProperties;
     props.setProperty('mail.smtp.auth',                'true');  % Note: 'true' as a string, not a logical value!
     props.setProperty('mail.smtp.starttls.enable',     'true');  % Note: 'true' as a string, not a logical value!
     props.setProperty('mail.smtp.socketFactory.port',  '465');   % Note: '465'  as a string, not a numeric value!
     props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
     sendmail('@gmail.com','Your vehicle is noted for Violated action'); 
     msg=urlread(strcat('http://login.bulksmsgateway.in/sendmessage.php?user=indnaren&password=Aravind@123&sender=Fabsys&mobile=8072192079&type=3&message=Violated+action'));
     port = serial('COM13') ;           % Creating serial port object now its connected to COM4
    get(port, 'Status');   
    fclose(port);
    get(port, 'Status'); 
% % 
% %Set connection properties
    port.Baudrate = 9600;      % Set the baud rate at the specific value
    set(port, 'Parity', 'none') ;     % Set parity as none
    set(port, 'Databits', 8) ;        % set the number of data bits
    set(port, 'stopBits', 1) ;        % set number of close bits as 1
    set(port, 'Terminator', 'LF') ; % set the terminator value to newline
    fopen(port);
    get(port, 'Status');
% writeDigitalPin(port, 'D3', 1);

    fprintf(port,'%c','A');
    pause(1);
    fclose(port);
else
    msgbox('NOT AN ISSUE');
end

