data {
    int<lower=0> n;
    vector<lower=0>[n] y;
}

parameters {
    real<lower=0> alpha;
    real<lower=0> beta;
}

model {
    alpha ~ lognormal(1, 0.5);
    beta  ~ lognormal(0, 0.5);

    y ~ gamma(alpha, beta);
}

generated quantities {
    vector[n] log_lik;
    vector[n] y_rep;

    for (i in 1:n) {
        log_lik[i] = gamma_lpdf(y[i] | alpha, beta);
        y_rep[i]   = gamma_rng(alpha, beta);
    }
}
