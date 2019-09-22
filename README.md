# Do androids read about electric sheep? - demo

## Environment

The commands below use Anaconda to manage the project environment.

```bash
conda env create -f environment.yml

conda env update -f environment.yml

conda activate droids-env

conda deactivate
```

## Jupyter

```bash
jupyter notebook

jupyter nbconvert hello.ipynb --to slides --post serve
```

### RISE slideshow

- Shift+Enter – Runs the cell on the current slide
- Spacebar – Goes forward a slide in the slideshow
- Shift+Spacebar – Goes back a slide in the slideshow
- double-click – To edit a Markdown cell
