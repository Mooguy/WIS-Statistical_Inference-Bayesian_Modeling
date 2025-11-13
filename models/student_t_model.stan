data {
    int<lower=0> n;              
    vector[n] y;                 
}

parameters {
    real mu;                     
    real<lower=0> sigma;         
    real<lower=1> nu;            
}

model {
    mu ~ normal(15, 5);                
    sigma ~ normal(10, 5);              
    nu ~ normal(0, 2.5);                 
    
    y ~ student_t(nu, mu, sigma);
}

generated quantities {
    vector[n] log_lik;
    vector[n] y_rep;
    
    for (i in 1:n) {
        log_lik[i] = student_t_lpdf(y[i] | nu, mu, sigma);
        y_rep[i] = student_t_rng(nu, mu, sigma);
    }
}
