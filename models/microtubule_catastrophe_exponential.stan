data {
    int<lower=0> n;           
    vector<lower=0>[n] y;  
}

parameters {
    real<lower=0> beta;    
}

model {
    beta ~ normal(0, 0.5); 
    y ~ exponential(beta);
}

generated quantities {
    vector[n] log_lik;
    vector[n] y_rep;

    for (i in 1:n) {
        log_lik[i] = exponential_lpdf(y[i] | beta);
        y_rep[i]   = exponential_rng(beta);
    }
}
