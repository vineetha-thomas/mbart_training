from transformers import MBartForConditionalGeneration, MBartTokenizer, MBartModel, MBartConfig

tokenizer = MBartTokenizer.from_pretrained('./tokenizer_de_hsb.model')
batch = tokenizer.prepare_seq2seq_batch('./dataset.txt', src_lang="en_XX", tgt_lang="ro_RO",return_tensors="pt")
config = MBartConfig()
model = MBartForConditionalGeneration(config)
model(input_ids=batch['input_ids']) # forward pass
model.save_pretrained('./trained_model')
