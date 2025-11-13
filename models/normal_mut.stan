data {
    int<lower=0> n;              
    vector[n] y;                 
}

parameters {
    real mu;                     
    real<lower=0> sigma;                  
}

model {
    mu ~ normal(15, 5);                
    sigma ~ normal(10, 5);              
              
    y ~ normal(mu, sigma);
}

generated quantities {
    vector[n] log_lik;
    vector[n] y_rep;
    
    for (i in 1:n) {
        log_lik[i] = normal_lpdf(y[i] | mu, sigma);
        y_rep[i] = normal_rng(mu, sigma);
    }
}
