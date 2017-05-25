function varargout = gui(varargin)


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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

 function gui_WindowKeyPressFcn(hObject, eventdata, handles)
 % determine the key that was pressed 
 keyPressed = eventdata.Key;
 if strcmpi(keyPressed,'return')
     % set focus to the button
     
    
 end
% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)


% Choose default command line output for gui

global y;
axes(handles.axes4);
y=imread('abc.jpg');
image(y);
axis off;
global x;
axes(handles.axes1);
x=imread('23.jpg');
image(x);
axis off
ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'bottom');
i=imread('17.jpg'); 
hi=imagesc(i);
set(ha,'handlevisibility','off','visible','off');
axes('position',[0.3,0.35,0.4,0.4]);
set(hi,'alphadata',0.5);

handles.output = hObject;
axis off
% Update handles structure
guidata(hObject, handles);

if ~isfield(handles,'hListener')
    handles.hListener = ...
        addlistener(handles.slider1,'ContinuousValueChange',@respondToContSlideCallback);
 end
numSteps = 100;
 set(handles.slider1, 'Min', 0);
 set(handles.slider1, 'Max', 0.99);
 set(handles.slider1, 'Value', 0.4);
 set(handles.slider1, 'SliderStep', [1/(numSteps-1) , 1/(numSteps-1) ]);
 % save the current/last slider value
 handles.lastSliderVal = get(handles.slider1,'Value');
 % Update handles structure
 guidata(hObject, handles);
% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


     set(handles.pushbutton3,'visible','off');
    set(handles.pushbutton4,'visible','off');
      set(handles.pushbutton2,'enable','off');
      
      set(handles.download,'enable','off');
     set(handles.tick,'visible','off');
    set(handles.cross,'visible','off');
    set(handles.slider1,'visible','off');


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



%UPLOAD FILE
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global str;
[myImage,mypath] = uigetfile('*.*','open');

    set(handles.download,'visible','on');
     set(handles.slider1,'visible','off');
    
      set(handles.download,'enable','on');
%[myImage,mypath] = uigetfile('D:\PHOTOS\CLG');
axes(handles.axes1)
str=strcat(mypath,myImage);
global m;
m=imread(str);
image(m)

axis off
global Rect;
Rect = imrect(gca,[50 20 200 200]);
setColor(Rect,'green')
setFixedAspectRatioMode(Rect,0);
fcn = makeConstrainToRectFcn('imrect',get(gca,'XLim'),get(gca,'YLim'));
setPositionConstraintFcn(Rect,fcn); 
Rect
     set(handles.pushbutton3,'enable','on');
    set(handles.pushbutton4,'enable','on');
     set(handles.tick,'enable','on');
    set(handles.cross,'enable','on');
     set(handles.pushbutton3,'visible','on');
    set(handles.pushbutton4,'visible','on');
     set(handles.tick,'visible','on');
    set(handles.cross,'visible','on');
axis image
%axes1(handles.myaxistag');
%imshow([mypath,myImage]);


%CONVERTTT ITT
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



global m;
global a;
global text;
text=enteringImage(a);
set(handles.pushbutton3,'enable','off');
set(handles.pushbutton4,'enable','off');
set(handles.pushbutton1,'enable','off');
set(handles.slider1,'enable','off');
dlmwrite('Untitled1.txt',text,' ');
!notepad Untitled1.txt


set(handles.pushbutton1,'enable','on');
[file,path]=uiputfile('*.txt','Save File As');
str=strcat(path,'/',file);
dlmwrite(str,text,'');
axes off;
set(handles.pushbutton1,'enable','on');
   set(handles.pushbutton3,'visible','off');
    set(handles.slider1,'visible','off');
    set(handles.pushbutton4,'visible','off');
global x;
axes(handles.axes1);
x=imread('23.jpg');
image(x);
axes off;


%CROPP
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Rect;global m;
        pos = getPosition(Rect);
        Crop = imcrop(m,pos);
       imshow(Crop, 'Parent', handles.axes1);
        guidata(hObject, handles);
     % axis(handles.axes1, 'image')
    m=Crop;
Rect = imrect(gca,[50 20 200 200]);
setColor(Rect,'green')
setFixedAspectRatioMode(Rect,0);
fcn = makeConstrainToRectFcn('imrect',get(gca,'XLim'),get(gca,'YLim'));
setPositionConstraintFcn(Rect,fcn); 



 


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to -be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

 function respondToContSlideCallback(hObject, eventdata)
     global m;
     global a;
 handles = guidata(hObject);
 newVal = (get(hObject,'Value'));
 set(hObject,'Value',newVal);
 if newVal ~= handles.lastSliderVal
     handles.lastSliderVal = newVal;
     guidata(hObject,handles);
     t=get(hObject,'Value');
     a=im2bw(m,t);
     imshow(a, 'Parent', handles.axes1);
 end

%ROTATE
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global m;
global im2;
m=imrotate(m,double(90));
imshow(m,'Parent',handles.axes1);
global Rect;
Rect = imrect(gca,[50 20 200 200]);
setColor(Rect,'green');
setFixedAspectRatioMode(Rect,0);
fcn = makeConstrainToRectFcn('imrect',get(gca,'XLim'),get(gca,'YLim'));
setPositionConstraintFcn(Rect,fcn); 
    set(handles.cross,'visible','on');
    set(handles.cross,'enable','on');
axis off;

% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cross.
function cross_Callback(hObject, eventdata, handles)
% hObject    handle to cross (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str;
global m;
global flag;
m=imread(str);
image(m)
flag=1;
axis off
global Rect;
Rect = imrect(gca,[50 20 200 200]);
setColor(Rect,'green');
setFixedAspectRatioMode(Rect,0);
fcn = makeConstrainToRectFcn('imrect',get(gca,'XLim'),get(gca,'YLim'));
setPositionConstraintFcn(Rect,fcn); 
axis off;
set(handles.cross,'visible','off');

% --- Executes on button press in tick.
function tick_Callback(hObject, eventdata, handles)
% hObject    handle to tick (see GCBO)
% even Crop1=im2bw(Crop,0.4
% handles    structure with handles and user data (see GUIDATA)
global m;
m=rgb2gray(m);
C=im2bw(m,0.4);
imshow(C,'Parent',handles.axes1);       
set(handles.tick,'visible','off');
set(handles.cross,'visible','off');
set(handles.slider1,'visible','on');

set(handles.slider1,'enable','on');
set(handles.pushbutton2,'enable','on');
set(handles.pushbutton4,'visible','off');
set(handles.pushbutton3,'visible','off');


% --- Executes on button press in download.
function download_Callback(hObject, eventdata, handles)
% hObject    handle to download (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)[file,path]=uiputfile('*.txt','Save File As');
global m;global a;
[file,path]=uiputfile('*.jpeg','Save Image As');
str=strcat(path,'/',file);
imwrite(a,str);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gui2;
close gui;