%Lab 14.5 - RC Circuit Application

%define constants that we're given
RC = 0.2;
%initial voltage across the capacitor
Vi = 2;
%applied voltage
Va = 10;

%use ode45 to solve the differential equation we are given
%solving for voltage after 0.25 seconds
[t,V] = ode45(@(t,V) (1/RC)*(Va-V), [0 0.25], Vi);
%using length of V to get the last value (right at .25 seconds) to then
%report that voltage. Very clever!
n = length(V);
fprintf("The voltage after 0.25s is %.2f V\n",V(n))

%solving for voltage after 0.5 seconds
[t,V] = ode45(@(t,V) (1/RC)*(Va-V), [0 0.5], Vi);
n = length(V);
fprintf("The voltage after 0.5s is %.2f V\n",V(n))

%solving for voltage after 1.0 seconds
[t,V] = ode45(@(t,V) (1/RC)*(Va-V), [0 1.0], Vi);
n = length(V);
fprintf("The voltage after 1s is %.2f V\n",V(n))

%now we want to find how long it takes for the voltage to reach 8 volts
%using logical comparison
%NOTICE HOW WE JUST USE THE V WE FOUND FROM THE ode45 FUNCTION. I'M
%ASSUMING SINCE THE FINAL V (FOR 1.0 SECONDS) INCLUDES VALUES BEFORE AND
%AFTER 8 VOLTS (SINCE THE MAX IS 9.95 VOLTS)
near8Volts = V>7.9 & V<8.1;
%filtering the time array with the logical array above
time8V = t(near8Volts);
fprintf("The capacitor reaches 8 volts at %.2f seconds\n",time8V)
plot(t,V)
ylim([0 10])
grid on
title("The Capacitor Voltage in an RC Circuit")
ylabel("Voltage (V)")
xlabel("Time (Seconds)")

%LED even after unplugged, will still not go out completely, this is due to
%there still being some charge in the capacitor. Should always be conscious
%of this





