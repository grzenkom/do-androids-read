# Basic NLP operations

1. Lemmatization
1. Part-of-speech (POS) tagging
1. Dependency parsing
1. Rule-based pattern matching
1. Named entity recognition (NER)
1. Word embeddings

## Lemmatization


```python
import spacy

nlp = spacy.load('en_core_web_sm')
```


```python
text = u'''She goes for a walk every day.
           He was going to the cinema in the evening.
           They have already gone to work.
           I took my coffee to go and went home.'''
word_to_find = u'go'
```


```python
doc = nlp(text)

for token in doc:
    if token.lemma_ == word_to_find:
        print(f'{token.text:<8} {token.lemma_}')
```

    goes     go
    going    go
    gone     go
    go       go
    went     go


## Part-of-speech (POS) tagging


```python
text = u'The sky above the port was the color of television, tuned to a dead channel.'
```


```python
doc = nlp(text)

for token in doc:
    print(f'{token.text:<12} {token.pos_}')
```

    The          DET
    sky          NOUN
    above        ADP
    the          DET
    port         NOUN
    was          VERB
    the          DET
    color        NOUN
    of           ADP
    television   NOUN
    ,            PUNCT
    tuned        VERB
    to           ADP
    a            DET
    dead         ADJ
    channel      NOUN
    .            PUNCT


## Dependency parsing


```python
text = u'Bob never took Spanish at school.'
doc = nlp(text)
```


```python
from spacy import displacy

displacy.render(doc, style="dep", jupyter=True)
```


<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="0" class="displacy" width="1100" height="312.0" style="max-width: none; height: 312.0px; color: #000000; background: #ffffff; font-family: Arial">
<text class="displacy-token" fill="currentColor" text-anchor="middle" y="222.0">
    <tspan class="displacy-word" fill="currentColor" x="50">Bob</tspan>
    <tspan class="displacy-tag" dy="2em" fill="currentColor" x="50">PROPN</tspan>
</text>

<text class="displacy-token" fill="currentColor" text-anchor="middle" y="222.0">
    <tspan class="displacy-word" fill="currentColor" x="225">never</tspan>
    <tspan class="displacy-tag" dy="2em" fill="currentColor" x="225">ADV</tspan>
</text>

<text class="displacy-token" fill="currentColor" text-anchor="middle" y="222.0">
    <tspan class="displacy-word" fill="currentColor" x="400">took</tspan>
    <tspan class="displacy-tag" dy="2em" fill="currentColor" x="400">VERB</tspan>
</text>

<text class="displacy-token" fill="currentColor" text-anchor="middle" y="222.0">
    <tspan class="displacy-word" fill="currentColor" x="575">Spanish</tspan>
    <tspan class="displacy-tag" dy="2em" fill="currentColor" x="575">ADJ</tspan>
</text>

<text class="displacy-token" fill="currentColor" text-anchor="middle" y="222.0">
    <tspan class="displacy-word" fill="currentColor" x="750">at</tspan>
    <tspan class="displacy-tag" dy="2em" fill="currentColor" x="750">ADP</tspan>
</text>

<text class="displacy-token" fill="currentColor" text-anchor="middle" y="222.0">
    <tspan class="displacy-word" fill="currentColor" x="925">school.</tspan>
    <tspan class="displacy-tag" dy="2em" fill="currentColor" x="925">NOUN</tspan>
</text>

<g class="displacy-arrow">
    <path class="displacy-arc" id="arrow-0-0" stroke-width="2px" d="M70,177.0 C70,2.0 400.0,2.0 400.0,177.0" fill="none" stroke="currentColor"/>
    <text dy="1.25em" style="font-size: 0.8em; letter-spacing: 1px">
        <textPath xlink:href="#arrow-0-0" class="displacy-label" startOffset="50%" fill="currentColor" text-anchor="middle">nsubj</textPath>
    </text>
    <path class="displacy-arrowhead" d="M70,179.0 L62,167.0 78,167.0" fill="currentColor"/>
</g>

<g class="displacy-arrow">
    <path class="displacy-arc" id="arrow-0-1" stroke-width="2px" d="M245,177.0 C245,89.5 395.0,89.5 395.0,177.0" fill="none" stroke="currentColor"/>
    <text dy="1.25em" style="font-size: 0.8em; letter-spacing: 1px">
        <textPath xlink:href="#arrow-0-1" class="displacy-label" startOffset="50%" fill="currentColor" text-anchor="middle">neg</textPath>
    </text>
    <path class="displacy-arrowhead" d="M245,179.0 L237,167.0 253,167.0" fill="currentColor"/>
</g>

<g class="displacy-arrow">
    <path class="displacy-arc" id="arrow-0-2" stroke-width="2px" d="M420,177.0 C420,89.5 570.0,89.5 570.0,177.0" fill="none" stroke="currentColor"/>
    <text dy="1.25em" style="font-size: 0.8em; letter-spacing: 1px">
        <textPath xlink:href="#arrow-0-2" class="displacy-label" startOffset="50%" fill="currentColor" text-anchor="middle">dobj</textPath>
    </text>
    <path class="displacy-arrowhead" d="M570.0,179.0 L578.0,167.0 562.0,167.0" fill="currentColor"/>
</g>

<g class="displacy-arrow">
    <path class="displacy-arc" id="arrow-0-3" stroke-width="2px" d="M420,177.0 C420,2.0 750.0,2.0 750.0,177.0" fill="none" stroke="currentColor"/>
    <text dy="1.25em" style="font-size: 0.8em; letter-spacing: 1px">
        <textPath xlink:href="#arrow-0-3" class="displacy-label" startOffset="50%" fill="currentColor" text-anchor="middle">prep</textPath>
    </text>
    <path class="displacy-arrowhead" d="M750.0,179.0 L758.0,167.0 742.0,167.0" fill="currentColor"/>
</g>

<g class="displacy-arrow">
    <path class="displacy-arc" id="arrow-0-4" stroke-width="2px" d="M770,177.0 C770,89.5 920.0,89.5 920.0,177.0" fill="none" stroke="currentColor"/>
    <text dy="1.25em" style="font-size: 0.8em; letter-spacing: 1px">
        <textPath xlink:href="#arrow-0-4" class="displacy-label" startOffset="50%" fill="currentColor" text-anchor="middle">pobj</textPath>
    </text>
    <path class="displacy-arrowhead" d="M920.0,179.0 L928.0,167.0 912.0,167.0" fill="currentColor"/>
</g>
</svg>


## Rule-based pattern matching


```python
text = u'''Corrective actions to the previous audit findings are not implemented in a timely manner.
           Most are not fully documented.
           There are even some findings that the team never discussed.'''
doc = nlp(text)
```


```python
from spacy.matcher import Matcher

negated_verb_pattern = [ {'DEP': 'neg'}, {'POS': 'VERB'} ]

matcher = Matcher(nlp.vocab)
matcher.add('NEGATED_VERB', None, negated_verb_pattern)
matches = matcher(doc)

for rule_id, start_token, end_token in matches:
    print(doc[start_token:end_token])
```

    not implemented
    never discussed



```python
# {'DEP': 'advmod', 'OP': '?'}, 
# advmod - adverbial modifier
```


```python
# Token attributes - https://spacy.io/usage/linguistic-features#adding-patterns-attributes
#    DEP - syntactic dependency
#    OP  - quantifier (`?` means optional)

# Dependency tokens - https://stackoverflow.com/a/40288324/95
#    neg    - negation modifier
#    advmod - adverbial modifier
```

## Named entity recognition (NER)


```python
text = u'Marek Grzenkowicz came to the Devoxx conference from Poland yesterday around 11 AM.'
doc = nlp(text)
```


```python
from spacy import displacy

displacy.render(doc, style="ent", jupyter=True)
```


<div class="entities" style="line-height: 2.5">
<mark class="entity" style="background: #aa9cfc; padding: 0.45em 0.6em; margin: 0 0.25em; line-height: 1; border-radius: 0.35em; box-decoration-break: clone; -webkit-box-decoration-break: clone">
    Marek Grzenkowicz
    <span style="font-size: 0.8em; font-weight: bold; line-height: 1; border-radius: 0.35em; text-transform: uppercase; vertical-align: middle; margin-left: 0.5rem">PERSON</span>
</mark>
 came to the 
<mark class="entity" style="background: #7aecec; padding: 0.45em 0.6em; margin: 0 0.25em; line-height: 1; border-radius: 0.35em; box-decoration-break: clone; -webkit-box-decoration-break: clone">
    Devoxx
    <span style="font-size: 0.8em; font-weight: bold; line-height: 1; border-radius: 0.35em; text-transform: uppercase; vertical-align: middle; margin-left: 0.5rem">ORG</span>
</mark>
 conference from 
<mark class="entity" style="background: #feca74; padding: 0.45em 0.6em; margin: 0 0.25em; line-height: 1; border-radius: 0.35em; box-decoration-break: clone; -webkit-box-decoration-break: clone">
    Poland
    <span style="font-size: 0.8em; font-weight: bold; line-height: 1; border-radius: 0.35em; text-transform: uppercase; vertical-align: middle; margin-left: 0.5rem">GPE</span>
</mark>

<mark class="entity" style="background: #bfe1d9; padding: 0.45em 0.6em; margin: 0 0.25em; line-height: 1; border-radius: 0.35em; box-decoration-break: clone; -webkit-box-decoration-break: clone">
    yesterday
    <span style="font-size: 0.8em; font-weight: bold; line-height: 1; border-radius: 0.35em; text-transform: uppercase; vertical-align: middle; margin-left: 0.5rem">DATE</span>
</mark>
 around 
<mark class="entity" style="background: #bfe1d9; padding: 0.45em 0.6em; margin: 0 0.25em; line-height: 1; border-radius: 0.35em; box-decoration-break: clone; -webkit-box-decoration-break: clone">
    11 AM
    <span style="font-size: 0.8em; font-weight: bold; line-height: 1; border-radius: 0.35em; text-transform: uppercase; vertical-align: middle; margin-left: 0.5rem">TIME</span>
</mark>
.</div>



```python
# Default spaCy entity types - https://spacy.io/api/annotation#named-entities
```

## Word embeddings


```python
nlp = spacy.load('en_core_web_md')  # larger models, with word vectors
```

1. Context-free language models
   - word2vec, GloVe, fastText
1. Contextual language models
   - ELMo, BERT

### Example
> He was sitting by the **river bank**.
>
> A **bank account** was opened for them in the morning.

1. Context-free language models - vectors trained on a text corpus from co-occurrence statistics
1. Contextual models - word representations that are a function of the entire context of sentence or paragraph

## Word embeddings


```python
vector_dog = nlp.vocab[u'dog'].vector
print(vector_dog[:42])
```

    [-0.40176   0.37057   0.021281 -0.34125   0.049538  0.2944   -0.17376
     -0.27982   0.067622  2.1693   -0.62691   0.29106  -0.6727    0.23319
     -0.34264   0.18311   0.50226   1.0689    0.14698  -0.4523   -0.41827
     -0.15967   0.26748  -0.48867   0.36462  -0.043403 -0.24474  -0.41752
      0.089088 -0.25552  -0.55695   0.12243  -0.083526  0.55095   0.3641
      0.15361   0.55738  -0.90702  -0.049098  0.3858    0.38      0.14425 ]



```python
print(f'length  = {len(vector_dog)}')
print(f'min_val = {min(vector_dog)}')
print(f'max_val = {max(vector_dog)}')
```

    length  = 300
    min_val = -2.7049999237060547
    max_val = 2.169300079345703


## Comparing word vectors

**Cosine similarity**
![cosine similarity in 2D](./images/vectors_cos_sim_600.png)

**Note:** For illustrative purposes only; the values above are random.

## Comparing word vectors


```python
from sklearn.metrics.pairwise import cosine_similarity

words = ['dog', 'husky', 'cat', 'horse', 'tree', 'stone', 'bitcoin']

for word in words:
    vector_word = nlp.vocab[word].vector
    
    cos_sim = cosine_similarity([vector_dog], [vector_word])  # calculate cosine between two vectors
    
    cos_sim = cos_sim[0][0]
    print(f'cos(dog, {word + ")":<8} = {cos_sim:>6.3f}')
```

    cos(dog, dog)     =  1.000
    cos(dog, husky)   =  0.859
    cos(dog, cat)     =  0.802
    cos(dog, horse)   =  0.625
    cos(dog, tree)    =  0.326
    cos(dog, stone)   =  0.265
    cos(dog, bitcoin) = -0.085


## Arithmetic of word vectors


```python
from sklearn.metrics.pairwise import cosine_similarity

def find_similar_vectors(word_vector, vocabulary, skip_words=(), num=3):
    """
    Finds vectors close to `word_vector` in terms of cosine similarity, inside given `vocabulary`.
    """
    result = [
        w
        for w in vocabulary
        if w.prob >= -15
        and w.is_lower
        and any(w.vector != word_vector)
        and w.orth_ not in skip_words
    ]
    result = sorted(
        result,
        key=lambda w: cosine_similarity([w.vector], [word_vector]),
        reverse=True
    )
    return [w.orth_ for w in result[:num]]
```


```python
find_similar_vectors(vector_dog, nlp.vocab, num=6)
```




    ['canines', 'dogs', 'puppy', 'poodle', 'terrier', 'husky']



## Arithmetic of word vectors
\begin{equation}
\LARGE{\mathit{    v_{parent} + v_{woman} = x    }}
\end{equation}


```python
x = nlp.vocab[u'parent'].vector + nlp.vocab[u'woman'].vector
find_similar_vectors(x, nlp.vocab, skip_words=[u'parent', u'woman'])
```




    ['mother', 'child', 'girl']



\begin{equation}
\LARGE{\mathit{    v_{seawater} - v_{salt} = x    }}
\end{equation}


```python
x = nlp.vocab[u'seawater'].vector - nlp.vocab[u'salt'].vector
find_similar_vectors(x, nlp.vocab, skip_words=[u'seawater', u'salt'])
```




    ['water', 'air', 'hydrant']



## Arithmetic of word vectors
\begin{equation}
\LARGE{\mathit{    v_{Switzerland} - v_{Basel} = x - v_{Poznan}    }}
\end{equation}

\begin{equation}
\large{\mathit{    x = v_{Poznan} + (v_{Switzerland} - v_{Basel})    }}
\end{equation}


```python
x = nlp.vocab[u'poznan'].vector + nlp.vocab[u'switzerland'].vector - nlp.vocab[u'basel'].vector
find_similar_vectors(x, nlp.vocab, skip_words=[u'poznan', u'switzerland', u'basel'])
```




    ['poland', 'sweden', 'norway']



\begin{equation}
\large{\mathit{    v_{Poland} = 
                     \underbrace{v_{Poznan}}_\text{a city}
                   + \underbrace{(v_{Switzerland} - v_{Basel})}_\text{concept of city's country}
}}
\end{equation}

## Yay!

![confetti](./images/jason-dent-zUD0bPRl30o-unsplash_1000.jpg)
Photo by [Jason Dent](https://unsplash.com/@jdent?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
on [Unsplash](https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

[![Built with spaCy](https://img.shields.io/badge/built%20with-spaCy-09a3d5.svg)](https://spacy.io)
