
function x_k = aposteriori_estimate(x_k_apriori,z_k,K_k,H_k)

x_k = x_k_apriori + K_k*(z_k - H_k*x_k_apriori);
