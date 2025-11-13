# Bayesian Modeling with Stan and Jupyter

This project is my submission for Weizmann Institute of Science Statistiacal Inference course.  
The project demonstrates Bayesian modeling and inference using Stan, Jupyter notebooks, and a reproducible Pixi environment. It includes example Stan models, data, and analysis notebooks to showcase model fitting, diagnostics, and visualization workflows.

---

## Project Structure

```

├─ notebooks/ # Jupyter notebooks for analysis and visualization
├─ models/ # Stan model files (.stan)
├─ data/ # Input data (if small/public)
├─ pixi.toml # Pixi environment specification
├─ pixi.lock # Locked dependency versions
├─ README.md
├─ LICENSE
└─ .gitignore

```

## Environment Setup

This project uses **Pixi** for environment management and reproducibility.

Install dependencies:
```bash
pixi install