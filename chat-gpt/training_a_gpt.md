# Training a GPT-Based Large Language Model (e.g GPT-Neo) with Happy Transformer

Assuming you already know how to [Use HappyTransformer for Text Generation](using_happy_transformer.md) -- this TIL focuses on training a large language model using your own "stuff".

This script will:

1. Initiate a generator
2. show what output it produces before training
3. Train it
4. show what output it produces after training
5. Save our trained model

Here is the script: (save this in a `.py` python file)

```python
from happytransformer import HappyGeneration, GENSettings, GENTrainArgs
prompt = "To make a cheese sandwich "
print(prompt)

# 1. Initiate a generator
happy_gen = HappyGeneration(model_type="GPT-NEO", model_name="EleutherAI/gpt-neo-1.3B")

generator_args = GENSettings(no_repeat_ngram_size=2, do_sample=True, early_stopping=False, top_k=5, temperature=0.8, max_length=30)

# 2. show what output it produces before training
print("RESULT BEFORE MORE... TRAINING....")
print("1:")
result = happy_gen.generate_text(prompt, args=generator_args)
print(prompt)
print(result.text)
print("2:")
result = happy_gen.generate_text(prompt, args=generator_args)
print(prompt)
print(result.text)
print("3:")
result = happy_gen.generate_text(prompt, args=generator_args)
print(prompt)
print(result.text)

# 3. Train it

# Description of the training args is coming up soon
trainer_args = GENTrainArgs(learning_rate =8e-5, num_train_epochs = 2, save_preprocessed_data=True, save_preprocessed_data_path="preprocessed-data.json", batch_size=4)
# input_filepath  -- a path file to a text file that contains nothing but text to train the model.
happy_gen.train(input_filepath = "cheese_instructions.txt", args=trainer_args)

# 4. show what output it produces after training
print("RESULT AFTER TRAINING....")
print("1:")
result = happy_gen.generate_text(prompt, args=generator_args)
print(prompt)
print(result.text)
print("2:")
result = happy_gen.generate_text(prompt, args=generator_args)
print(prompt)
print(result.text)
print("3:")
result = happy_gen.generate_text(prompt, args=generator_args)
print(prompt)
print(result.text)

# 5. Save our trained model
happy_gen.save("model/")
```

Next time we go to initiate our generator, we can load our trained model...

```python
# happy_gen = HappyGeneration(model_type="GPT-NEO", model_name="EleutherAI/gpt-neo-1.3B") -- add a 'load_path' argument...
happy_gen = HappyGeneration(model_type="GPT-NEO", model_name="EleutherAI/gpt-neo-1.3B", load_path="model/")
```

## Training Args

Parameters used by GENTrainArgs ---

Below is a table with all of the parameters. First a discussion of those used in the example above:

```python
trainer_args = GENTrainArgs(learning_rate =8e-5, num_train_epochs = 2, save_preprocessed_data=True, save_preprocessed_data_path="preprocessed-data.json", batch_size=4)
```

I gave a very high learning rate (8 times the default), so that learning could be demonstrated quickly, even if it was possibly **too extreme**.

I set `save_preprocessed_data_path` to `preprocessed-data.json` -- this produces an interesting `json` file, which demonstrates how the tokenization works (more on that soon).

| Parameters					|Default| Description            |
|-------------------------------|-------|------------------------|
| `learning_rate`				|5e-5  	| How much the model's weights are adjusted per step. Too low and the model will take a long time to learn or get stuck in a suboptimal solution. Too high can cause can divergent behaviors. |
| `num_train_epochs`			|3     	| The number of times the training data is iterated over. |
| `batch_size`					|1     	| Number of training examples used per iteration |
| `weight_decay`				|0     	| A type of regularization. It prevents weights from getting too large. Thus, preventing overfitting.|
| `adam_beta1`					|0.9   	| The beta1 parameter for the Adam with weight decay optimizer. |
| `adam_beta2`					|0.999 	| The beta2 parameter for the Adam with weight decay optimizer.|
| `adam_epsilon`				|1e-8  	| The epsilon parameter for the Adam with weight decay optimizer. |
| `max_grad_norm`				|1.0   	| Used to prevent exploding gradients. Prevents the derivatives of the loss function from exceeding the absolute value of `max_grad_norm`.|
| `save_preprocessed_data`		|False	| |
| `save_preprocessed_data_path`	|""   	| |
| `load_preprocessed_data`		|False	| |
| `load_preprocessed_data_path`	|""   	| |
| `preprocessing_processes`		|1    	| |
| `fp16`						|False	| If true, enables half precision training which saves space by using 16 bits instead of 32 to store the model's weights. Only available when CUDA/a a GPU is being used.|


## About the training data

For the purposes of this example, I generated a file of cheese sandwich making instructions, with one sentence per line.

I used the "spintax" sentence, and plugged it into the spintax spinner here: [spintax test editor](https://wiki.secretgeek.net/article/spin) - then used [NimbleText](https://NimbleText.com) to sort it, remove duplicates, and shuffle it. That gave me a lot of boring examples, for illustration purposes.

'''spintax
{you can|you should|anyone can} {construct|build|make} {a|a basic|your|your basic|a yummy} cheese sandwich {by|by just|by simply} {putting|placing|sticking|inserting|tucking} a {cheese slice|slice of cheese|cheese slice (or two)|slab of cheese} {between|in-between|inside} two {pieces|slices} of {bread|toast|your favorite bread}
'''

## Sources

- [HappyTransformer Learning Parameters](https://happytransformer.com/learning-parameters/)
- [GPT Neo made easy](https://www.vennify.ai/gpt-neo-made-easy/amp/)

## See also

- [Using HappyTransformer for Text Generation and More](using_happy_transformer.md)
