import torch
from kobert_transformers import get_tokenizer
from torch.utils.data import Dataset

class WellnessTextClassificationDataset(Dataset):
    def __init__(self,
                 file_path="./data/input_v2.txt",
                 num_label=432,
                 device='cuda',
                 max_seq_len=512,  # KoBERT max_length
                 tokenizer=None
                 ):
        self.file_path = file_path
        self.device = device
        self.data = []
        self.tokenizer = tokenizer if tokenizer is not None else get_tokenizer()

        with open(self.file_path, 'r', encoding='utf-8') as file:
            for line_num, line in enumerate(file, start=1):
                datas = line.split("    ")
                if len(datas) != 2:
                    print(f"Error reading line {line_num}: {line}")
                    continue

                index_of_words = self.tokenizer.encode(datas[0])
                token_type_ids = [0] * len(index_of_words)
                attention_mask = [1] * len(index_of_words)

                padding_length = max_seq_len - len(index_of_words)
                index_of_words += [0] * padding_length
                token_type_ids += [0] * padding_length
                attention_mask += [0] * padding_length

                try:
                    label = int(datas[1][:-1])
                except ValueError:
                    print(f"Error reading label on line {line_num}: {line}")
                    continue

                data = {
                    'input_ids': torch.tensor(index_of_words).to(self.device),
                    'token_type_ids': torch.tensor(token_type_ids).to(self.device),
                    'attention_mask': torch.tensor(attention_mask).to(self.device),
                    'labels': torch.tensor(label).to(self.device)
                }

                self.data.append(data)

    def __len__(self):
        return len(self.data)

    def __getitem__(self, index):
        return self.data[index]

if __name__ == "__main__":
    dataset = WellnessTextClassificationDataset()
    print(dataset)

