clear all;

%%%% Set the Gaussian parameter
mu = [0,0]; 
sym_LoS_wall = 0.02;
sym_2nd_wall = 0.05;
sym_Corner = 0.01;
sym_Ref = 0.03;

Sigma_LoS_wall = [0.005 sym_LoS_wall; sym_LoS_wall 0.005];
Sigma_2nd_wall = [0.005 sym_2nd_wall; sym_2nd_wall 0.005];
Sigma_Corner = [0.005 sym_Corner; sym_Corner 0.005];
Sigma_Ref =  [0.005 sym_Ref; sym_Ref 0.005];

Sigma_LoS_wall = Spd_Mat(Sigma_LoS_wall);
Sigma_2nd_wall = Spd_Mat(Sigma_2nd_wall);
Sigma_Corner = Spd_Mat(Sigma_Corner);
Sigma_Ref = Spd_Mat(Sigma_Ref);


%%%% Generate grid
x1 = -4:.2:4; 
x2 = -4:.2:4;
grid_coordinations = cell(41,41);
for k = 1:numel(x1)
    for h = 1:numel(x2)
        grid_coordinations{k,h} = [x1(k),x2(h)];
    end
end

%%%% Generate the ground truth of class 1: LoS walls
for  k = 1:30 wall_1{k} = grid_coordinations{31,k}; end
for  k = 1:30 wall_2{k} = grid_coordinations{10,k+11}; end
for  k = 1:31 wall_3{k} = grid_coordinations{k,1}; end
for  k = 1:31 wall_4{k} = grid_coordinations{k+10,41}; end

%%%% Generate the ground truth of class 2: 2nd walls
for  k = 1:41 wall_5{k} = grid_coordinations{41,k}; end
for  k = 1:41 wall_6{k} = grid_coordinations{1,k}; end
for  k = 1:10 wall_7{k} = grid_coordinations{k+31,1}; end
for  k = 1:10 wall_8{k} = grid_coordinations{k,41}; end

%%%% Generate the ground truth of class 3: Cornors
for k = 1:3 
    for h = 1:3 
        corner_A{1,(k-1)*3+h} = grid_coordinations{38+k,h};
        corner_B{1,(k-1)*3+h} = grid_coordinations{28+k,h};
        corner_C{1,(k-1)*3+h} = grid_coordinations{k,h};
        corner_D{1,(k-1)*3+h} = grid_coordinations{38+k,38+h};
        corner_E{1,(k-1)*3+h} = grid_coordinations{11+k,38+h};
        corner_F{1,(k-1)*3+h} = grid_coordinations{k,38+h};
    end
end

%%%%% Connect cell the noised cells
ground_truth_cell = [wall_1,wall_2,wall_3,wall_4,wall_5,wall_6,wall_7,wall_8,corner_A,corner_B,corner_C,corner_D,corner_E,corner_F];
LoS_noise = cell(1,142);
second_noise = cell(1,102);
Corner_noise = cell(1,54);
for k = 1:142 
    LoS_noise{k}=Sigma_LoS_wall; 
end
for k = 1:102 
    second_noise{k}=Sigma_2nd_wall; 
end
for k = 1:54  
    corner_noise{k}=Sigma_Corner; 
end
Noise_type = [LoS_noise,second_noise,corner_noise];

%%%%% Allocated the 36000 points to noised cells
No_measurement = 500;
for k = 1:No_measurement 
    indecs(k) = round(numel(ground_truth_cell)*rand); 
end

for k = 1:No_measurement
    if  indecs(k) < 1 
        indecs(k) = 1;
    elseif indecs(k) > 278
        indecs(k) = 278;
    else
        indecs(k) = indecs(k);
    end
end
for k = 1:No_measurement
    Allocated_to_wall{k} = ground_truth_cell{indecs(k)} + mvnrnd(mu,Noise_type{indecs(k)});
end


%%%%% Reference ground truth: 1600
P = zeros(41,41);
for k = 1:No_measurement
    for h = 1:41
        for g = 1:41
            p(h,g) = mvnpdf(Allocated_to_wall{k},grid_coordinations{h,g},Sigma_Ref);
        end
    end
    P = P + p;

    k
end

P = flipud(P)
imagesc(P)






