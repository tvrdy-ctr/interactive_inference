#! /bin/bash
# idm results
# model_name="idm"
# exp_names=(
#     "11-03-2022 08-49-45"
#     "11-03-2022 08-50-33"
#     "11-03-2022 08-54-16"
#     "11-08-2022 13-47-23"
#     "11-08-2022 13-47-56"
#     "11-20-2022 17-25-19"
#     "11-20-2022 17-25-45"
#     "11-20-2022 17-26-10"
#     "11-20-2022 17-26-37"
#     "11-20-2022 17-27-04"
#     "11-20-2022 17-27-30"
#     "11-20-2022 17-27-59"
#     "11-20-2022 17-28-26"
#     "11-20-2022 17-28-54"
#     "11-20-2022 17-29-22"
# )

# mlp results
# model_name="mlp"
# exp_names=(
#     "11-03-2022 09-00-58"
#     "11-03-2022 11-18-31"
#     "11-03-2022 11-29-19"
#     "11-08-2022 13-50-15"
#     "11-08-2022 13-53-07"
#     "11-20-2022 12-04-35"
#     "11-20-2022 12-07-12"
#     "11-20-2022 12-09-45"
#     "11-20-2022 12-12-20"
#     "11-20-2022 12-14-52"
#     "11-20-2022 12-17-29"
#     "11-20-2022 12-20-11"
#     "11-20-2022 12-22-45"
#     "11-20-2022 12-25-28"
#     "11-20-2022 12-27-56"
# )

# rnn results
# model_name="rnn"
# exp_names=(
#     "11-04-2022 17-57-50"
#     "11-07-2022 11-02-30"
#     "11-07-2022 11-09-10"
#     "11-08-2022 14-00-29"
#     "11-08-2022 14-06-59"
#     "11-08-2022 14-13-41"
#     "11-08-2022 15-53-49"
#     "11-20-2022 10-15-08"
#     "11-20-2022 10-21-31"
#     "11-20-2022 10-28-03"
#     "11-20-2022 10-34-31"
#     "11-20-2022 10-41-00"
#     "11-20-2022 10-47-21"
#     "11-20-2022 10-53-54"
#     "11-20-2022 11-00-20"
# )

# vin results
model_name="vin"
exp_names=(
    "11-13-2022 22-59-15"
    # "11-14-2022 14-58-13"
    # "11-14-2022 15-44-39"
    # "11-14-2022 16-24-43"
    # "11-14-2022 17-09-40"
    # "11-20-2022 16-06-03"
    # "11-20-2022 16-44-19"
    # "11-20-2022 17-22-32"
    # "11-20-2022 18-00-12"
    # "11-20-2022 18-38-11"
    # "11-20-2022 19-15-49"
    # "11-20-2022 19-53-16"
    # "11-20-2022 20-30-51"
    # "11-20-2022 21-09-00"
    # "11-20-2022 21-46-41"
)

for exp_name in "${exp_names[@]}";
    do
    echo $exp_name
    # test in distribution
    python eval_online.py \
    --filename "vehicle_tracks_000.csv,vehicle_tracks_003.csv,vehicle_tracks_007.csv" \
    --test_lanes "3,4" \
    --agent $model_name \
    --exp_name "$exp_name" \
    --min_eps_len 100 \
    --max_eps_len 500 \
    --num_eps 100 \
    --sample_method acm \
    --playback False \
    --test_on_train False \
    --test_posterior False \
    --seed 0 \
    --save_summary False \
    --save_data False \
    --save_video False

    # test out of distribution
    python eval_online.py \
    --filename "vehicle_tracks_000.csv,vehicle_tracks_003.csv,vehicle_tracks_007.csv" \
    --test_lanes "0,2" \
    --agent $model_name \
    --exp_name "$exp_name" \
    --min_eps_len 50 \
    --max_eps_len 500 \
    --num_eps 100 \
    --sample_method acm \
    --playback False \
    --test_on_train False \
    --test_posterior False \
    --seed 0 \
    --save_summary True \
    --save_data False \
    --save_video False
    done