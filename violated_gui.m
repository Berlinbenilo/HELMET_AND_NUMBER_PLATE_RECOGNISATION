function varargout = violated_gui(varargin)
% VIOLATED_GUI MATLAB code for violated_gui.fig
%      VIOLATED_GUI, by itself, creates a new VIOLATED_GUI or raises the existing
%      singleton*.
%
%      H = VIOLATED_GUI returns the handle to a new VIOLATED_GUI or the handle to
%      the existing singleton*.
%
%      VIOLATED_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIOLATED_GUI.M with the given input arguments.
%
%      VIOLATED_GUI('Property','Value',...) creates a new VIOLATED_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before violated_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to violated_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help violated_gui

% Last Modified by GUIDE v2.5 07-Mar-2020 22:06:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @violated_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @violated_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before violated_gui is made visible.
function violated_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to violated_gui (see VARARGIN)

% Choose default command line output for violated_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
ha = axes('unit','normalized','position',[0 0 1 1]);
ah =imread('1.jpeg');
imagesc(ah);
set(ha,'handlevisibility','off','visible','off');
uistack(ha,'top');
j=imread('8.jpg');
axes(handles.axes2);
imshow(j);
% UIWAIT makes violated_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = violated_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
[filename,filepath]=uigetfile('file selector');
x=strcat([filepath,filename]);
I=imread(x);
axes(handles.axes1);
imshow(I);
save image.mat I

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global I
load violated.mat
ds= augmentedImageDatastore(imageSize,I);
imagefeature = activations(net, ds, featureLayer, ...
    'MiniBatchSize', 32, 'OutputAs', 'columns');
f1 = predict(classifier,imagefeature, 'ObservationsIn', 'columns');
pop_up = sprintf('%s',f1);
msgbox(pop_up)
% load plate.mat
% [bboxes,scores] = detect(detector2,I);
% I = insertObjectAnnotation(I,'rectangle',bboxes,'');
% figure;
% imshow(I)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run extract.m

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run violated_cnn.m
