%% Plotting Results from Sim with Controller
close all
n = length(t);
set(0,'DefaultLineMarkerSize',5)
set(0,'DefaultAxesFontSize',22)
set(0,'DefaultTextFontSize',26)
set(0,'DefaultLineLineWidth',3)

q_err_out = quat_error(q_out(:, 1:4), q_nom);

figure()
subplot(4,1,1)
plot([t; t(end)+dt], [NaN; q_err_out(:, 1)])
hold on
grid on
title('q_{err1} vs time')
hold off


subplot(4,1,2)
plot([t; t(end)+dt], [NaN; q_err_out(:, 2)])
hold on
% plot(t(2:end), q_det(1:end-1, 2), 'b:')
grid on
title('q_{err2} vs time')
hold off

subplot(4,1,3)
plot([t; t(end)+dt], [NaN; q_err_out(:, 3)])
hold on

% plot(t(2:end), q_det(1:end-1, 3), 'b:' )
grid on
title('q_{err3} vs time')
hold off

subplot(4,1,4)
plot([t; t(end)+dt], [NaN; q_err_out(:, 4)])
hold on

% plot(t(2:end), q_det(1:end-1, 4), 'b:')
grid on
title('q_{err4} vs time')
xlabel('time, seconds')
hold off

figure()
plot(t, M_des(:,1), t, M_des(:,2), t, M_des(:,3))
hold on
legend('M_{cx}','M_{cy}','M_{cz}')
xlabel('time, seconds')
ylabel('M_c, Nm')
title('Control Torques over Time')
hold off


% figure()
% plot(t, q_out(:, 5))
% figure()
% plot(t, q_out(:, 6))
% figure()
% plot(t, q_out(:, 7))

figure()
subplot(4, 1, 1)
plot(t, abs(q_out(:, 1)))
hold on
plot(t, abs(q_nom(:, 1)), 'r')
ylabel('q_1')
hold off

subplot(4, 1, 2)
plot(t, abs(q_out(:, 2)))
hold on
plot(t, abs(q_nom(:, 2)), 'r')
ylabel('q_2')
hold off

subplot(4, 1, 3)
plot(t, abs(q_out(:, 3)))
hold on
plot(t, abs(q_nom(:, 3)), 'r')
ylabel('q_3')
hold off

subplot(4, 1, 4)
plot(t, abs(q_out(:, 4)))
hold on
plot(t, abs(q_nom(:, 4)), 'r')
xlabel('time, seconds')
ylabel('q_4')
hold off
% 
% plot(t, abs(q_out(:, 1)), t, abs(q_out(:, 2)), t, abs(q_out(:, 3)), t, abs(q_out(:, 4)))
% hold on
% plot(t, abs(q_nom(:, 1)), 'r',t,abs(q_nom(:, 2)), 'r',t, abs(q_nom(:, 3)), 'r',t, abs(q_nom(:, 4)), 'r')
% legend('q_{true1}','q_{true2}','q_{true3}','q_{true4}','q_{nom}')
% xlabel('time, seconds')
% ylabel('quaternion values')
sgtitle('{\color{blue}Ground Truth} and {\color{red}Nominal Quaternions} over Time', 'FontSize', 24)
% hold off
% axes_plot(DCM_err, sc)

% t_plot = t(1:1000);
% M_act_plot = M_act(1:1000,:);
% Mc_act_out_plot = Mc_act_out(1:1000,:);
%
% figure
% subplot(3,1,1)
% plot(t_plot,M_act_plot(:,1),'-',t_plot,Mc_act_out_plot(:,1),'-')
% legend('Desired M_cx','Output M_cx')
% xlabel('Time (seconds)')
% ylabel('M_cx')
% %axis([0 20000 -5 5])
% subplot(3,1,2)
% plot(t_plot,M_act_plot(:,2),'-',t_plot,Mc_act_out_plot(:,2),'-')
% legend('Desired M_cy','Output M_cy')
% xlabel('Time (seconds)')
% ylabel('M_cy')
% %axis([0 20000 -5 5])
% subplot(3,1,3)
% plot(t_plot,M_act_plot(:,3),'-',t_plot,Mc_act_out_plot(:,3),'-')
% legend('Desired M_cz','Output M_cz')
% xlabel('Time (seconds)')
% ylabel('M_cz')
% %sgtitle('Desired vs. Output Torque')
% %axis([0 20000 -5 5])

figure
subplot(3,1,1)
plot(t, Mc_act(:,1),'-', t, M_des(:,1),'-')
xlabel('Time (seconds)')
ylabel('M_cx')
%axis([0 20000 -5 5])
subplot(3,1,2)
plot(t, Mc_act(:,2),'-',t, M_des(:,2),'-')
xlabel('Time (seconds)')
ylabel('M_cy')
%axis([0 20000 -5 5])
subplot(3,1,3)
plot(t, Mc_act(:,3),'-',t, M_des(:,3),'-')
xlabel('Time (seconds)')
ylabel('M_cz')
sgtitle(['{\color{orange}Desired Torque} and {\color{blue}Actual Torque} vs. Time'],'fontsize',24)
