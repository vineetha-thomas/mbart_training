(----ReadMe update on 11 April 2021----)
- fairseq scripts are updated and tested.
- Refer to the readme update below. Steps 1-7 needs to be done.
- Step 8 is not required as  I use --joined-dictionary option in fairseq-prepreocess.
- Run fairseq_preprocess.sh. For the 'multilingal_denoising' task of fairseq, it expects the preprocessed language data to be in two separate folders. This is taken care of in the script. The final preprocessed files are put in a folder 'preprocessed'
- Run fairseq_train.sh, it saves the checkpoints. To modify the training parameters, this script needs to be modified.

NOTE: As testing, running the fairseq_train.sh for a couple of epochs to genertae the model checkpoint has been tested on a very small portion of data. testing on the entire corpus and validating the model itself is not done.

 


(----ReadMe update on 10 March 2021----)

Based on the preious experiments, huggingface alone cannot be used in our case, as it does not do the preprocessing or the noising part as required by the mbart. Henc ewe decided to switch to fairseq code repo. For that, below are the basic steps.

1. Use the same virtual env as was created below.
2. Install fairseq (https://github.com/pytorch/fairseq)
3. pip install sentencepiece
4. Now the folders in our setup
    - The corpus is in the folder corpus/
    - It has folders corpus/de/ and corpus/hsb for the two languages
    - The directory datset/ will contain the test-train splits and also the same files encoded by spm
5. First we need to generate the dataset by sampling the corpus. For thism using Cody's script
    - sample_corpus.sh
    - It creates the files inside /dataset
6. Then we need to train our sentencepiece model. For this I use all the data in our corpus
    - spm_train.sh
    - The trained spm model is stored in tokenizer/
7. Then we encode our datset using the spm model we just trained.
    - spm_encode.sh
    - The output files are stored in dataset/
8. Then we generate the combined dictionary as required by the fairseq commands
    - token_counter.py, token_counter.sh 
    - The python script is from Cody. Need to understand the output it generates.
9. The next step would be to run the fairseq-preprocess and fairseq train





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


