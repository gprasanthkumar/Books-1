function activation = inertia_neuron(theta,sigma_theta,centre_theta)

activation = [1];
for i = 1:length(centre_theta)
x = theta' - centre_theta(i,:)';
activation = [activation;(1/(sqrt(2*pi)*sigma_theta^3))*(1 - x'*x/sigma_theta^2)*exp(-(x'*x/(2*sigma_theta^2)))];
end

