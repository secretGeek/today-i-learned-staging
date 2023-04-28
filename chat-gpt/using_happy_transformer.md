# Using HappyTransformer for Text Generation and More

Install HappyTransformer

(From an **elevated** / admin shell) (With python 3, and [pip](../python/pip.md), available)

```python
pip install happytransformer
```

## First Program

This program will download the model 'EleutherAI/gpt-neo-1.3B' which is a few gigabytes, and takes a while to download (the first time only)

And we will ask it to generate text that continues on from our prompt of "To make a cheese sandwich ".

The result will be very repetitive...

(Save this in a `my-first-script.py` python file. Execute it with `> python my-first-script.py`)

```python
from happytransformer import HappyGeneration

# first time you run this it will take a long time to download the model 'EleutherAI/gpt-neo-1.3B' which is a few gigabytes.
happy_gen = HappyGeneration("GPT-NEO", "EleutherAI/gpt-neo-1.3B")

# as we provided no other arguments, the output will be very repetitive
result = happy_gen.generate_text("To make a cheese sandwich ")
print(result)
print(result.text)
```

And will probably not get you any closer to making a cheese sandwich.

## Using arguments to Refine Our Text Generation

We need to provide more arguments to the `generate_text` method. It has a parameter. `args` that takes an object of type `GENSettings`.

Let's see how to use that...

### Less repetitive

By providing an argument with the parameter `no_repeat_ngram_size=2` it means than any chunk of two or more tokens won't be *repeated* in the output.

```python
from happytransformer import HappyGeneration, GENSettings

generation_args = GENSettings(no_repeat_ngram_size=2)
happy_gen = HappyGeneration("GPT-NEO", "EleutherAI/gpt-neo-1.3B")

result = happy_gen.generate_text("To make a cheese sandwich ", args=generation_args)
print(result)
print(result.text)
```

`Jargon` -- I haven't described what a "token" is yet -- for now, consider it to be like "a word" though sometimes it's a fragment of a word (...for common fragments). We can see *exactly* what a token is when we look at `tokenization`, or when we look at [training our GPT](training_a_gpt.md).

### Knobs and Dials for you to explore

This time we set more than just the `no_repeat_ngram_size` parameter.

```python
from happytransformer import HappyGeneration, GENSettings

# We set `no_repeat_ngram_size`, `do_sample`, `early_stopping`, `top_k`, `temperature`
generation_args = GENSettings(no_repeat_ngram_size=2, do_sample=True, early_stopping=False, top_k=50, temperature=0.7)
happy_gen = HappyGeneration("GPT-NEO", "EleutherAI/gpt-neo-1.3B")

result = happy_gen.generate_text("To make a cheese sandwich  ", args=generation_args)
print(result)
print(result.text)
```

Here are all the parameters for `GENSettings` (from [Happy Transformer documentation](https://happytransformer.com/text-generation/settings/))

| Parameter					| Default		| Definition	|
|---------------------------|---------------|---------------|
| `min_length`				| 10			| Minimum number of generated tokens |
| `max_length`				| 50			| Maximum number of generated tokens |
| `do_sample`				| False			| When True, picks words based on their conditional probability |
| `early_stopping`			| False			| When True, generation finishes if the `EOS` (end of stream) token is reached |
| `num_beams`				| 1				| Number of steps for each search path |
| `temperature`				| 1.0			| How sensitive the algorithm is to selecting low probability options |
| `top_k`					| 50			| How many potential answers are considered when performing sampling |
| `top_p`					| 1.0			| Min number of tokens are selected where their probabilities add up to `top_p` |
| `no_repeat_ngram_size`	| 0				| The size of an n-gram that cannot occur more than once. Note `0=infinity` (I've determined that this is not true for one's bank balance, btw.) |
| `bad_words`				| None			| List of words/phrases that cannot be generated. |

## Sources

- [Happy Transformer Text Generation Settings](https://happytransformer.com/text-generation/settings/)
- [Using HappyTransformer for Text Generation and More](using_happy_transformer.md)
- [PIP: Pip installs Packages](../python/pip.md)

## See also

- [Training a GPT-Based Large Language Model (e.g GPT-Neo)](training_a_gpt.md)
