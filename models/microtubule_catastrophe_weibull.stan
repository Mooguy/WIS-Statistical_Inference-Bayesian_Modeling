data {
    int<lower=0> n;               
    vector<lower=0>[n] y;         
}

parameters {
    real<lower=0> alpha;          
    real<lower=0> sigma;          
}

model {
    alpha ~ lognormal(5, 1);    
    sigma ~ lognormal(2, 1);         
    y ~ weibull(alpha, sigma);
}

generated quantities {
    vector[n] log_lik;
    vector[n] y_rep;

    for (i in 1:n) {
        log_lik[i] = weibull_lpdf(y[i] | alpha, sigma);
        y_rep[i]   = weibull_rng(alpha, sigma);
    }
}
