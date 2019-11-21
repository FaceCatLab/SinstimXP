
% SinStim_*   Parameter file for SinStim 1.8
%	This file is an example of a SinStim's latest version's parameter file. It contains 
%	explanation about each parameter.
%
% "Gen" and "ByPart" parameters:
%   - "Gen.ParameterName": is a general parameter: it can takes only one value.
%   - "ByPart.ParameterName": is a parameter which can take one value, as above, or can take
%     different values for different "parts". See the other example file, "sinstim_Example_2parts_v1p4",
%     about simuli composed of several parts.
%
% Versions history:
%   New parameters (above v1.0) are marked with a <v1.x> tag. They are not required: if missing 
%   a default value (reproducing behavior of older SinStim versions) will be used.
%
%   New params v1.2:
%       - ByPart.VariesAfter
%       - Gen.Events.FirstIdentityChange
%   New params v1.3:
%       - Gen.Priority
%       - Gen.Scale
%   New params v1.5:                          Obsolete param v1.5:
%       - Gen.isIsochronousMode                     - ByPart.BetweenRepeat
%       - Gen.Events.MissedFrame
%       - Gen.isPhotodiode
%       - Gen.PhotodiodeSquareSize
%       - ByPart.RandPattern
%       - ByPart.EventPattern
%   New param v1.6.1:
%       - Gen.PhotodiodeLocation
%   New param v1.8:
%       - ByPart.GapBetweenPatterns

%%%
%adaptation w/ change detection : full face sequences w/ repetition
%display & basic parameters copied from Adriano/adaptation_full_faces XP
%%%

%% DISPLAY
% Display:
Gen.Screen = 1; % 1: Full screen display, 2: Display on secondary screen, 0: Display in a window. => set to 0 during creation
Gen.Resolution = [800 600]; % Display [width heigth] in pixels. Use "ResolutionTest" to get supported resolutions.
Gen.ScreenTheoreticalFreq = 100; % Screen frequency set in MS-Windows (Hz). (Must be 100 on EEG experimental setup.)
Gen.NumFramesToTestFreq = 4000; % Set 4000 or 5000 for EEG experiment (!!!)

% Gamma:
Gen.ScreenGamma = 2.25; % Screen gamma value. Must be measured for each screen.
Gen.ApparentGammaCorrection = 1.6; % Value between 1 and ScreenGamma. Visual effect only. No impact on computations.

% Missed Screen Refreshes:
Gen.isIsochronousMode = 1; % 1: Correct missed frames (by skipping the next one), 0: Don't.
Gen.MissedFramesTolerance = 4; % Number of missed frames to trigger a warning message.

% Image Files:
% You'll be asked to browse for the image directory at running time. To change your image set, 
% simply create a new directory and copy to it the needed image files. Image categories ("Parts")
% is determined by a file name prefix, defined by the parameter below:
ByPart.PartNames = ''; % Names of the image parts and prefix to the image file names.
%                        We have no parts in this case (we display whole faces). 

% Image Processing: 1) Background:
Gen.Background.isBackground = 1; % 1: Images have a background, which must be automatically detected. 0: No background.
Gen.Background.OriginalColor = [.54 .54 .54]; % [r g b] Background in the BMP files. DON'T USE GRAY BACKGROUNDS !!!
Gen.Background.FinalColor = [.5 .5 .5]; % [r g b] Original background will be replaced by this.
ByPart.Background.ColorError = 10/255; % Error tolerance to automatically find background pixels.
ByPart.Background.ErodeBorder = 6; % Number of pixels of foreground to remove at the border. 
ByPart.Background.FillHoles = 1; % to fill eyes
ByPart.Background.doEqualize = 0; % 1: Equalize backgrounds (keep common area). 0: Don't.
ByPart.Background.doMakeItTransparent = 1; % 1: Make background transparent. 0: Replace by background color.

% Image Processing: 2) Other:
ByPart.doConvertToGrayscale = 0; % 1: Convert from color to grayscale. 0: Don't.
ByPart.doEqualizeSize = 1; % 1: Equalize size of matrices. Use this to avoid bugs. 0: Don't. Not tested.
ByPart.doEqualizeHue = 0; % <TODO> 1: Equalize the hue of all images (for color images). 0: Don't.
ByPart.doEqualizeLuminance = 1; % 1: Equalize the luminance of all images. 0: Don't.
ByPart.doScramblePixels = 0; % 1: Scramble foreground pixels in the images. 0: Don't.

% Position and Scale:
ByPart.X = 0;  % X co-ord. (in pixels). 0 = center of the screen;
ByPart.Y = 0; % Y co-ord. (in pixels). 0 = center of the screen;
ByPart.HorizontalAlignement = 'C'; % 'L' (Left), 'C' (Center), 'R' (Right).
ByPart.VerticalAlignement = 'C'; % 'T' (Top), 'C' (Center), 'B' (Bottom).
ByPart.AxesRotation = 0; % 0: Normal orientation. % 180: Upside down.
Gen.Scale = [0.80 0.84 0.88 0.92 0.96 1 1.04 1.08 1.12 1.16 1.20]; % Image scales. 1=100pc  <v1.3>

% Fix Point:
% (If you don't want a fix point, set: Gen.FixPoint.Size = 0;)
Gen.FixPoint.Size = 12; % (pixels)
Gen.FixPoint.Shape = 'cross'; % 'cross', 'round' or 'square'.
Gen.FixPoint.Color = [0 0 0]; % Normal color.
Gen.FixPoint.LineWidth = 2; % Line thickness. Set to 0 to get plain square/round.
Gen.FixPoint.Y = 0; % Y offset (pixels).
% Fix Point Changes:
Gen.FixPoint.NumChanges = 10; % Number of color changes in one run.
Gen.FixPoint.WhatChanges = 'C'; % 'C' (color), 'S' (shape), or '-' (nothing).  <v1.1>
Gen.FixPoint.ChangedShape = 'square'; % 2d shape for shape changes.  <v1.1>
Gen.FixPoint.ChangedColor = [1 0 0]; % 2d color for color changes.
Gen.FixPoint.ColorChangeDur = 300; %(ms) Duration of change (for both color and shape changes).

% Keyboard events to get:
Gen.ResponseKey = 'Space'; % Name of the key that subject has to press for response.  <v1.1>
%                            Type "getkeyname ?" to get all valid key names.


%% EXPERIMENT
% Durations:
Gen.DelayBefore = 2 + 3 * rand; % (sec) # secs before stim. begin. Use "rand" (e.g.: 5 + 10*rand;) to get random delay. <v1.1>
Gen.Duration = 64; % (sec) Duration of stimulation.
Gen.DelayAfter = 1; % (sec) <v1.1>
Gen.FadeIn = 2;
Gen.FadeOut = 2; 
 
% Conditions (!!!)
% What varies in the experiment?
ByPart.WhatVaries = 'N'; %'I': Image, Interlaced mode: one change per half-phase (with overlap).
%                         'N': image, Non-interlaced mode: one change per phase (no overlap).
%                         'L': Luminance.
%                         'T': Transparency.
%                         '-': Nothing.

ByPart.VariesAfter = 0; % (sec) 'N' condition only: Delay before identity begins to change. <v1.2>

% Sine Waves:
ByPart.WaveForm = 'sine'; % 'square', 'sine'.
ByPart.WaveFreq = 6; % Sinusoid freq. (Hz). NB: 4 Hz sinusoid = 8 identities per sec!
ByPart.isHarmonic = 1; % 1: Round to closest screen frequency divisor. 0: Don't.
%ByPart.BetweenRepeat = 1; % <v1.5: obsolete>

% Sine range:
ByPart.AlphaRange = [0 1]; % [min,max] values between 0 and 1.

% Save data
Gen.SaveDir = 'd:\Exp_EEG_Matlab';

%% EVENTS (="triggers")
% Events to send through Parallel port or Photodiode:
% - Parallel port: events can be integers from 1 to 254.
%   In case of co-incidence, event # will be added. (==> Choose carefully the numbers with that in mind.)
% - Photodiode: use 1000 (left diode) or 2000 (right diode) value.
ByPart.Events.SineMax = 0; % # to send at each sine wave max. 0: Send nothing.
ByPart.Events.SineMin = 1000; % # to send at each sine wave min. 0: Send nothing.
Gen.Events.Start  = 211; % Display start.
Gen.Events.TenSec = 0; % 15(!) sec after start. <v1.2: changed from 10 to 15 sec.>
Gen.Events.FirstIdentityChange = 99; % if ByPart.VariesAfter > 0, see below. <v1.2>
Gen.Events.Stop   = 254; % Display end.
Gen.Events.MissedFrame = 100; % Missed refresh deadline error code. <v1.5>

% Pattern <v1.5>
%new script to customise patterns

ByPart.RandPattern = 'AAAAa'; % Randomization pattern. Use lower-case letters. Example: 'abcdeee'. Default is 'a'. <v1.5>
ByPart.EventPattern = [1, 1, 1, 1, 6]; % Same as events above. Events will be sent at begining of the period (sine min). <v1.5>

% Photodiode <v1.5>
Gen.isPhotodiode = 1; % 1: Display a black/white square on the upper-left corner for photodiode. 0: don't. <v1.5>
Gen.PhotodiodeLocation = [1 0; 0 0]; %  <v1.6.1>
Gen.PhotodiodeSquareSize = 20; % Size in pixels of the photodiode square. <v1.5>
