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

#### Keyboard shortcuts

- Shift+Enter – Runs the cell on the current slide
- Spacebar – Goes forward a slide in the slideshow
- Shift+Spacebar – Goes back a slide in the slideshow
- double-click – To edit a Markdown cell

#### Customizing RISE

To change the presentation theme:

1. Go to _Edit / Edit Notebook Metadata_
2. Append `"rise": {"theme": "sky"}` to the JSON content
3. (!) Restart the notebook for the changes to take place

Check the [documentation](https://rise.readthedocs.io/en/maint-5.5/customize.html#choosing-a-theme)
for other settings that can be customized.

### Stripping the notebook output

A filter configured in `.gitattributes` automatically strips the output from the notebooks
on commit. You can also manually run:

```bash
nbstripout nlp_101.ipynb
``` 
