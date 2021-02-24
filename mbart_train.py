TGT_DATA = "./data_tgt_de.txt"
SRC_DATA = "./data_source_hsb.txt"

from transformers import MBartForConditionalGeneration, MBartTokenizer, MBartModel, MBartConfig

#Read from the data files
src_txts = []
tgt_txts = []
with open(SRC_DATA) as f:
    for line in f:
        src_txts.append(line)

with open(TGT_DATA) as f:
    for line in f:
        tgt_txts.append(line)


tokenizer = MBartTokenizer.from_pretrained('./tokenizer_de_hsb.model')
batch = tokenizer.prepare_seq2seq_batch(src_texts=src_txts, src_lang="en_XX", 
                                        tgt_texts=tgt_txts, tgt_lang="ro_RO",
                                        return_tensors="pt")
config = MBartConfig()
model = MBartModel(config)
model(input_ids=batch['input_ids'], decoder_input_ids=batch['labels']) # forward pass
model.save_pretrained('./trained_model')



