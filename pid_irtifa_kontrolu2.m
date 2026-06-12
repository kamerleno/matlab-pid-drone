%% Baykar Staj - IHA Irtifa PID Kontroloru
clear; clc; close all;

%% 1. PARAMETRELER
Kp = 1.5;
Ki = 0.2;
Kd = 2.0;

hedef_irtifa = 10;
dt = 0.05;
sure = 10;

%% 2. BASLANGIC KOSULLARI
t = 0:dt:sure;
n = length(t);

irtifa   = zeros(1,n);
hiz      = zeros(1,n);
hata     = zeros(1,n);
integral = 0;
prev_hata = 0;

%% 3. SIMULASYON DONGUSU
for i = 2:n
    hata(i)  = hedef_irtifa - irtifa(i-1);
    integral = integral + hata(i)*dt;
    turev    = (hata(i) - prev_hata)/dt;

    u = Kp*hata(i) + Ki*integral + Kd*turev;

    ktle   = 1.0;
    surukle = 0.4;
    ivme   = (u - surukle*hiz(i-1)) / ktle;

    hiz(i)    = hiz(i-1) + ivme*dt;
    irtifa(i) = irtifa(i-1) + hiz(i)*dt;
    irtifa(i) = max(0, irtifa(i));

    prev_hata = hata(i);
end

%% 4. GRAFIK
figure('Name','IHA PID Kontroloru','Color','white','Position',[100 100 800 500]);

subplot(2,1,1);
plot(t, irtifa, 'b-', 'LineWidth', 2); hold on;
plot(t, hedef_irtifa*ones(size(t)), 'r--', 'LineWidth', 1.5);
xlabel('Zaman (s)'); ylabel('Irtifa (m)');
title('IHA Irtifa Kontrolu - PID');
legend('Drone irtifasi','Hedef irtifa','Location','southeast');
grid on;

subplot(2,1,2);
plot(t, hata, 'm-', 'LineWidth', 1.5);
xlabel('Zaman (s)'); ylabel('Hata (m)');
title('Hata Sinyali');
grid on;

%% 5. PERFORMANS
[maks, ~] = max(irtifa);
asim = max(0, (maks - hedef_irtifa)/hedef_irtifa * 100);
fprintf('Asim: %.2f%%\n', asim);

settled = find(abs(irtifa - hedef_irtifa) < 0.5, 1);
if ~isempty(settled)
    fprintf('Oturma suresi: %.2fs\n', t(settled));
end