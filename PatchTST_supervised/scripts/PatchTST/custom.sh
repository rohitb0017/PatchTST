if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi
seq_len=1024
model_name=PatchTST

root_path_name=./dataset/
data_path_name=Beijing_Weather.csv
model_id_name=Beijing_Weather
data_name=custom

random_seed=2021
#for pred_len in 96 192 336 720
for pred_len in 192
do
   # python -u /content/PatchTST/PatchTST_supervised/run_longExp.py \
     python -u /kaggle/working/PatchTST/PatchTST_supervised/run_longExp.py \
      --random_seed $random_seed \
      --is_training 1 \
      --root_path $root_path_name \
      --data_path $data_path_name \
      --model_id $model_id_name_$seq_len'_'$pred_len \
      --model $model_name \
      --data $data_name \
      --features M \
      --seq_len $seq_len \
      --pred_len $pred_len \
      --enc_in 7 \
      --e_layers 3 \
      --n_heads 8 \
      --d_model 128 \
      --d_ff 128 \
      --dropout 0.5\
      --fc_dropout 0.5\
      --head_dropout 0.5\
      --patch_len 16\
      --stride 8\
      --des 'Exp' \
      --train_epochs 100\
      --itr 1 --batch_size 128 --learning_rate 0.0001 
done
