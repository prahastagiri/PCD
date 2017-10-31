function varargout = tugas1(varargin)
% TUGAS1 MATLAB code for tugas1.fig
%      TUGAS1, by itself, creates a new TUGAS1 or raises the existing
%      singleton*.
%
%      H = TUGAS1 returns the handle to a new TUGAS1 or the handle to
%      the existing singleton*.
%
%      TUGAS1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGAS1.M with the given input arguments.
%
%      TUGAS1('Property','Value',...) creates a new TUGAS1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tugas1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tugas1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tugas1

% Last Modified by GUIDE v2.5 31-Oct-2017 17:48:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tugas1_OpeningFcn, ...
                   'gui_OutputFcn',  @tugas1_OutputFcn, ...
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

% --- Executes just before tugas1 is made visible.
function tugas1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tugas1 (see VARARGIN)

% Choose default command line output for tugas1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tugas1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = tugas1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% ---------------------------- MAIN PROGRAM --------------------------

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

% --- Executes on button press in Load.
function Load_Callback(hObject, eventdata, handles)
% hObject    handle to Load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file_name,path_name]=uigetfile({'*.jpg';'*.png';},...
    'Import image');
if ~isequal (file_name,0)
    handles.data1=imread(fullfile(path_name,file_name));
    guidata(hObject, handles);
    axes(handles.axes1);
    imshow(handles.data1);
else
    return
end

% --- Executes on button press in Greyscale.
function Greyscale_Callback(hObject, eventdata, handles)
% hObject    handle to Greyscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i=handles.data1;
gray = .299*i(:,:,1) + .587*i(:,:,2) + .114*i(:,:,3);
axes(handles.axes1);
imshow(gray);

% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p = handles.data1;
axes(handles.axes1);
imshow(p);

% --- Executes on button press in UpButton.
function UpButton_Callback(hObject, eventdata, handles)
% hObject    handle to UpButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.data1;
p=im2double(a);
step = 5;
ylim(ylim+step);

% --- Executes on button press in RightButton.
function RightButton_Callback(hObject, eventdata, handles)
% hObject    handle to RightButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.data1;
p=im2double(a);
step = 5;
xlim(xlim-step);

% --- Executes on button press in LeftButton.
function LeftButton_Callback(hObject, eventdata, handles)
% hObject    handle to LeftButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.data1;
p=im2double(a);
step = 5;
xlim(xlim+step);

% --- Executes on button press in DownButton.
function DownButton_Callback(hObject, eventdata, handles)
% hObject    handle to DownButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.data1;
p=im2double(a);
step = 5;
ylim(ylim-step);

% --- Executes on slider movement.
function SldBrightness_Callback(hObject, eventdata, handles)
% hObject    handle to SldBrightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a=handles.data1;
p=im2double(a);
val=1.0*get(hObject,'Value')-0.25;
set(handles.SldBrightnessInfo,'String',num2str(val));
bright=p+val;
axes(handles.axes1);
imshow(bright);

% --- Executes during object creation, after setting all properties.
function SldBrightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SldBrightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function SldBrightnessInfo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SldBrightnessInfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in Brightnessx1.
function Brightnessx1_Callback(hObject, eventdata, handles)
% hObject    handle to Brightnessx1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.data1;
gray = .299*a(:,:,1) + .587*a(:,:,2) + .114*a(:,:,3);
[row column]=size(gray);
for i=1:1:row
    for j=1:1:column
        x(i,j)=gray(i,j)*2; %brightness of image increase 2x
    end
end
axes(handles.axes1);
imshow(x);

% --- Executes on button press in Brightnessx2.
function Brightnessx2_Callback(hObject, eventdata, handles)
% hObject    handle to Brightnessx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.data1;
gray = .299*a(:,:,1) + .587*a(:,:,2) + .114*a(:,:,3);
[row column]=size(gray);
for i=1:1:row
    for j=1:1:column
        x(i,j)=gray(i,j)/2; %brightness of image decrease 8x
    end
end
axes(handles.axes1);
imshow(x);


% --- Executes on slider movement.
function SldZoom_Callback(hObject, eventdata, handles)
% hObject    handle to SldZoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Greyscale_Callback(hObject, eventdata, handles);
zoomFactor = get(hObject,'Value');
 axes(handles.axes1);
 zoom('out');
 zoom(zoomFactor);
 zoominfo = sprintf('%.2f (%d %%)', zoomFactor, round(zoomFactor * 100));
 set(handles.zoominfo, 'String', zoominfo);

 % Set up to allow panning of the image by clicking and dragging.
 % Cursor will change to little hand when it's on the image.
 
 set(handles.axes1, 'ButtonDownFcn', 'disp(''This executes'')');
 set(handles.axes1, 'Tag', 'DoNotIgnore');
 h = pan;
 set(h, 'ButtonDownFilter', @myPanCallbackFunction);
 set(h, 'Enable', 'on');
 return;
 
  function [flag] = myPanCallbackFunction(obj, eventdata)
 disp(['In myPanCallbackFunction, you clicked on a ' get(obj,'Type') 'object.'])
 objTag = get(obj, 'Tag');
 if strcmpi(objTag, 'DoNotIgnore')
 flag = true;
 else
 flag = false;
 end
 return;

% --- Executes during object creation, after setting all properties.
function SldZoom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SldZoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function zoominfo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zoominfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in Crop.
function Crop_Callback(hObject, eventdata, handles)
% hObject    handle to Crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 c=handles.data1;
 x1 = 186;
 x2 = 911;
 y1 = 105;
 y2 = 810;
 xmin = x1;
 ymin= y1;
 width = x2-x1;
 height = y2-y1;
 crop = imcrop(c,[xmin ymin width height]);
 axes = handles.axes1;
 imshow(c);
 

% --- Executes on button press in Warping.
function Warping_Callback(hObject, eventdata, handles)
% hObject    handle to Warping (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
w=handles.data1;
im = .299*w(:,:,1) + .587*w(:,:,2) + .114*w(:,:,3);
[r0 c0 d0] = size(im);
mx = max(r0,c0);
imo = imresize(im,[mx mx]);
 
m = floor(mx/2);
 
im00 = imo(1:m,1:m,:);
im01 = imo(1:m,m+1:end,:);
im11 = imo(m+1:end,m+1:end,:);
im10 = imo(m+1:end,1:m,:);
 
for i = 1:m
  u = im00(m:-1:i,i,:);
  v = im00(i,i+1:m,:);
  s = [];
  s(:,:,1) = [u(:,:,1)' v(:,:,1)];
  cd = size(s,2);
  R = m;
  for j = 1:0.2:cd
    a = 90*j/cd;
    q = m+1-floor((m-i)*cosd(a));
    z = m+1-floor((m-i)*sind(a));
    ds(z,q,:) = s(1,floor(j),:);
  end
  u = im01(i,1:m+1-i,:);
  v = im01(i:m,m+1-i,:);
  s = [];
  s(:,:,1) = [u(:,:,1) v(:,:,1)'];
  cd = size(s,2);
  R = m;
  for j = 1:0.2:cd
    a = 90*j/cd;
    q = m+1+floor((m-i)*cosd(90-a));
    z = m+1-floor((m-i)*sind(90-a));
    ds(z,q,:) = s(1,floor(j),:);
  end
  u = im11(1:m+1-i,m+1-i,:);
  v = im11(m+1-i,m+1-i:-1:1,:);
  s = [];
  s(:,:,1) = [u(:,:,1)' v(:,:,1)];
  cd = size(s,2);
  R = m;
  for j = 1:0.2:cd
    a = 90*j/cd;
    q = m+1+floor((m-i)*cosd(a));
    z = m+1+floor((m-i)*sind(a));
    ds(z,q,:) = s(1,floor(j),:);
  end
  u = im10(m+1-i,m:-1:i,:);
  v = im10(m+1-i:-1:1,i,:);
  s = [];
  s(:,:,1) = [u(:,:,1) v(:,:,1)'];
  cd = size(s,2);
  R = m;
  for j = 1:0.2:cd
    a = 90*j/cd;
    q = m+1-floor((m-i)*cosd(90-a));
    z = m+1+floor((m-i)*sind(90-a));
    ds(z,q,:) = s(1,floor(j),:);
  end

end
axes(handles.axes1);
hsl = cast(ds,'uint8');
imshow(hsl);

% --- Executes on button press in Histogram.
function Histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Grayscale_Callback(hObject, eventdata, handles);
img = handles.data1;
p=im2double(img);
[x,y,z]=size(p);
red = ones(1,256);
if(z>1)
green = ones(1,256);
blue = ones(1,256);
end
    for i = 1:x
        for j = 1:y
            red(img(i,j,1)+1)=red(img(i,j,1)+1)+1;
            if(z>1)
            green(img(i,j,2)+1)=green(img(i,j,2)+1)+1;
            blue(img(i,j,3)+1)=blue(img(i,j,3)+1)+1;
            end
        end
    end
 red = double(log(red));
   if(z>1)
   green = double(log(green));
   blue = double(log(blue));
   end
show_hist = figure('Name',' Histogram','NumberTitle','off');
 figure(show_hist);
   
% Plot Histogram
   if(z>1)
    level=0:1:255;
    bar(level,red,'Barwidth',1,'Facecolor',[1 0 0],'Edgecolor',[1 0 0]);
   
    hold on;
    bar(level,green,'Barwidth',1,'Facecolor',[0 1 0],'Edgecolor',[0 1 0]);
    hold on;
    
    bar(level,blue,'Barwidth',1,'Facecolor',[0 0 1],'Edgecolor',[0 0 1]);
    hold off;
   else
    level=0:1:255;
    bar(level,red,'Barwidth',1,'Facecolor',[0 0 0],'Edgecolor',[1 1 1]);
   
   end
    axis tight;


% --- Executes on button press in convolusion.
function convolusion_Callback(hObject, eventdata, handles)
% hObject    handle to convolusion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
w = handles.data1;
A = .299*w(:,:,1) + .587*w(:,:,2) + .114*w(:,:,3);
I = double(A);
sigmax = 2;
sigmay = 2.5;
sz = 3;
[x,y]=meshgrid(-sz:sz,-sz:sz);
M = size(x,1)-1;
N = size(y,1)-1;

%Gaussian
Exp_comp = -(x.^2+y.^2)/(2*sigmax*sigmay);
Kernel= exp(Exp_comp)/(2*pi*sigmax*sigmay);
hasil=zeros(size(I));
I = padarray(I,[sz sz]);
 
%Convolution
for i = 1:size(I,1)-M
    for j =1:size(I,2)-N
        Temp = I(i:i+M,j:j+M).*Kernel;
        hasil(i,j)=sum(Temp(:));
    end
end
axes(handles.axes1);
hasil = uint8(hasil);
imshow(hasil);


% --- Executes on button press in Mean.
function Mean_Callback(hObject, eventdata, handles)
% hObject    handle to Mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
w=handles.data1;
w= .299*w(:,:,1) + .587*w(:,:,2) + .114*w(:,:,3);
w=double(w);

%create zeros matrix
[row,column]=size(w); 
zero=zeros(row,column);

%create matrix filter with 3x3 window size. for perfect results use 3x3
m=3; n=3;
a=ones(m,n);

%process filtering on original matrix image using mean
for ii=1:row-(m-1)
    for jj=1:column-(n-1)
    aa=a.*w(ii:m+ii-1,jj:n+jj-1);
    b=reshape(aa,1,m*n);
    b=sort(b);
    b=round(mean(b));
    zero(ii+1,jj+1)=b;
    end
end

%Rearrange the final matrix after the filter.
for ii=2:row-1
    for jj=1:column
        if jj==1
        n=w(ii,jj);
        elseif jj==column
        n=w(ii,jj);
        else
        n=0;
        end
        mmed(ii-1,jj)=n;
    end
end
mmed=[w(1,:);mmed;w(row,:)];
mmed=mmed+zero;

axes(handles.axes1);
imshow(mmed,[0 255]);


% --- Executes on button press in Median.
function Median_Callback(hObject, eventdata, handles)
% hObject    handle to Median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
w=handles.data1;
w= .299*w(:,:,1) + .587*w(:,:,2) + .114*w(:,:,3);
w=double(w);

%create zeros matrix
[row,column]=size(w); 
zero=zeros(row,column);

%create matrix filter with 3x3 window size. for perfect results use 3x3
m=3; n=3;
a=ones(m,n);

%process filtering on original matrix image using median
for ii=1:row-(m-1)
    for jj=1:column-(n-1)
    aa=a.*w(ii:m+ii-1,jj:n+jj-1);
    b=reshape(aa,1,m*n);
    b=sort(b);
    b=median(b);
    zero(ii+1,jj+1)=b;
    end
end

%Rearrange the final matrix after the filter.
for ii=2:row-1
    for jj=1:column
        if jj==1
        n=w(ii,jj);
        elseif jj==column
        n=w(ii,jj);
        else
        n=0;
        end
        mmed(ii-1,jj)=n;
    end
end
mmed=[w(1,:);mmed;w(row,:)];
mmed=mmed+zero;

axes(handles.axes1);
imshow(mmed,[0 255]);


% --- Executes on button press in Modus.
function Modus_Callback(hObject, eventdata, handles)
% hObject    handle to Modus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
w=handles.data1;
w= .299*w(:,:,1) + .587*w(:,:,2) + .114*w(:,:,3);
w=double(w);

%create zeros matrix
[row,column]=size(w); 
zero=zeros(row,column);

%create matrix filter with 3x3 window size. for perfect results use 3x3
m=3; n=3;
a=ones(m,n);
%process filtering on original matrix image using median
%process filtering on original matrix image using median
for ii=1:row-(m-1)
    for jj=1:column-(n-1)
    aa=a.*w(ii:m+ii-1,jj:n+jj-1);
    b=reshape(aa,1,m*n);
    b=sort(b);
    b=mode(b);
    zero(ii+1,jj+1)=b;
    end
end

%Rearrange the final matrix after the filter.
for ii=2:row-1
    for jj=1:column
        if jj==1
        n=w(ii,jj);
        elseif jj==column
        n=w(ii,jj);
        else
        n=0;
        end
        mmed(ii-1,jj)=n;
    end
end
mmed=[w(1,:);mmed;w(row,:)];
mmed=mmed+zero;

axes(handles.axes1);
imshow(mmed,[0 255]);