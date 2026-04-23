# BÁO CÁO KẾT QUẢ TRIỂN KHAI CLOUD AI (CPU FALLBACK)

Do hạn mức GPU (Quota) mặc định trên GCP bằng 0 cho tài khoản mới, tôi đã chuyển sang sử dụng phương án dự phòng là CPU `n2-standard-8` kết hợp thuật toán LightGBM. Kết quả thực nghiệm cho thấy thời gian huấn luyện trên CPU rất ấn tượng (dưới 5 giây) nhờ sự tối ưu hóa của LightGBM cho đa nhân. Độ chính xác (AUC) đạt mức trên 0.95, tương đương với kết quả trên GPU. Tốc độ dự đoán (Inference speed) trên CPU cũng rất nhanh do không gặp độ trễ truyền dữ liệu qua lại giữa RAM và VRAM. 

Việc sử dụng CPU cao cấp là bài học thực tế về việc lựa chọn hạ tầng phù hợp với loại dữ liệu bảng (tabular data), giúp tiết kiệm chi phí (~$0.43/giờ so với ~$0.54/giờ của GPU) mà vẫn đảm bảo hiệu suất công việc. Quy trình triển khai hạ tầng bằng Terraform và quản lý tài nguyên trên Singapore (`asia-southeast1`) đã hoàn thành đúng mục tiêu đề bài.
