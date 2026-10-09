/**
 * JavaScript tương tác cho Hệ thống Quản lý Sản phẩm
 */

document.addEventListener('DOMContentLoaded', function () {
    // Tự động ẩn thông báo Alert sau 4 giây
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(function (alert) {
        setTimeout(function () {
            alert.style.transition = 'opacity 0.5s ease';
            alert.style.opacity = '0';
            setTimeout(function () {
                if (alert.parentElement) {
                    alert.parentElement.removeChild(alert);
                }
            }, 500);
        }, 4000);
    });

    // Xử lý đóng alert thủ công
    const closeButtons = document.querySelectorAll('.alert-close');
    closeButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            const alert = this.closest('.alert');
            if (alert) {
                alert.remove();
            }
        });
    });

    // Lắng nghe phím ESC để đóng Modal
    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') {
            closeDeleteModal();
        }
    });
});

/**
 * Mở modal xác nhận xóa sản phẩm
 * @param {number} id Mã sản phẩm
 * @param {string} name Tên sản phẩm
 */
function confirmDelete(id, name) {
    const modal = document.getElementById('deleteModal');
    const deleteForm = document.getElementById('deleteForm');
    const productNameEl = document.getElementById('deleteProductName');

    if (modal && deleteForm && productNameEl) {
        productNameEl.textContent = name;
        deleteForm.action = contextPath + '/products?action=delete&id=' + id;
        modal.classList.add('active');
    }
}

/**
 * Đóng modal xác nhận xóa
 */
function closeDeleteModal() {
    const modal = document.getElementById('deleteModal');
    if (modal) {
        modal.classList.remove('active');
    }
}
