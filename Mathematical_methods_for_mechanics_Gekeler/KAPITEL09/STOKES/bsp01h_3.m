function [RDU,RDV,RDP,FU,FV,RDZ,RCZ,RCP] = bsp01h_3(p,e,p1)
% same as bsp01h_2.m but all segments open
% lid driven cavity,
% boundary conditions for Taylor-Hood-Element
% RDU = [left terminal point of edge;
%       data;
%       data of midpoints]
% with improvements by R.Vanselow

% -- BOUNDARY CONDITIONS for U and V
I = find(e(5,:) == 1); LI = length(I);    % boundary segment 1 (below)
RDU1 = [e(1,I(2:LI)); zeros(1,LI-1)];     % left open, right open
RDU1 = [RDU1, [e(8,I); zeros(1,LI)]];
RDV1 = RDU1;

I = find(e(5,:) == 2); LI = length(I);     % boundary segment 2 (right)
RDU2 = [e(1,I(2:LI)); zeros(1,LI-1)];              % below open, above open 
RDU2 = [RDU2, [e(8,I); zeros(1,LI)]];
RDV2 = RDU2;

I = find(e(5,:) == 3); LI = length(I);     % boundary segment 3 (above)
RDU3 = [e(1,I(2:LI)); ones(1,LI-1)];               % right open, left open 
RDU3 = [RDU3, [e(8,I); ones(1,LI)]];
RDV3 = [e(1,I); zeros(1,LI)];
RDV3 = [RDV3, [e(8,I); zeros(1,LI)]];

I = find(e(5,:) == 4); LI = length(I);     % boundary segment 4 (left)
RDU4 = [e(1,I(2:LI)); zeros(1,LI-1)]; % above open, below open
RDU4 = [RDU4, [e(8,I); zeros(1,LI)]];
RDV4 = RDU4;  

RDU = [RDU1, RDU2, RDU3, RDU4];
RDV = [RDV1, RDV2, RDV3, RDV4];

% -- Data for P (one value) ------
%N1 = size(p,2);
RDP = [5;0]; % zero at midpoint of bottom

% -- LOADS ----------------------------
FU = zeros(size(p,2)+size(p1,2),1); FV = FU;

% -- DIRICHLET BOUNDARY CONDITIONS FOR STREAM FUNCTION
I  = find(e(5,:) == 1); LI = length(I); % Randsegment 1
RDZ1 = [e(1,I); zeros(1,LI)];           % all closed/open
RDZ1 = [RDZ1,[e(8,I); zeros(1,LI)]];

I  = find(e(5,:) == 2); LI = length(I); % Randsegment 2
RDZ2 = [e(1,I); zeros(1,LI)];
RDZ2 = [RDZ2,[e(8,I); zeros(1,LI)]];

I  = find(e(5,:) == 3); LI = length(I); % Randsegment 3
RDZ3 = [e(1,I); zeros(1,LI)];
RDZ3 = [RDZ3,[e(8,I); zeros(1,LI)]];

I  = find(e(5,:) == 4); LI = length(I); % Randsegment 4
RDZ4 = [e(1,I); zeros(1,LI)];
RDZ4 = [RDZ4,[e(8,I); zeros(1,LI)]];

RDZ = [RDZ1,RDZ2,RDZ3,RDZ4];

I    = find(e(5,:) == 3); LI = length(I); % Boundary 3
RCZ  = [e([1,8,2],I); zeros(1,LI); ones(1,LI)];
RCZ = [];
% -- data for pressure phase ---------------------
I    = find(e(5,:) == 3); LI = length(I); % Boundary 3
RCP  = [e([1,8,2],I); zeros(1,LI); ones(1,LI)];

