import sentencepiece as spm
spm.SentencePieceTrainer.train(input='./dataset.txt', model_prefix='tokenizer_de_hsb', vocab_size=100)
