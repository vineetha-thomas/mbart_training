(ReadMe last updated on 3 Feb 2021)

Below are the basic set-up to run the scripts

1. Create the python virtual environment
- python -m venv mbart_venv

2. Activate the virtual environmnet
- source mbart_venv/bin/activate 

3. Install the necessary packages into the virtual environment
- pip install transformers (https://github.com/huggingface/transformers)
- pip install tokenizers (https://github.com/huggingface/tokenizers)
- pip install torch
- pip install sentencepiece (https://github.com/google/sentencepiece)


Described below is the basic workflow to train mbart using hugginface transformer interface.
1. Download the data for german and upper sorbian (script not implemented)
2. Sample the datasets by up/down sampling text from each language (script not integrated)
3. Train a sentencepiece tokenizer on the data
    - spm_tokenize.py
    - Trained tokenizer is saved in the same path as m.model
    - (Questions)
        - What should the vocab_size be set to?
        - Should the script be modified to read from multiple files or one combined .txt file?
4. Train mbart on the dataset
    - mbart_train.py
    - (Questions)
            - What is the difference between MBartModel and MBartForConditionalGeneration
            - What exactly does prepare_seq2seq_batch() do?
            - Verify if the model training part is correct?
            - How to evaluate the generated model? Perplexity?