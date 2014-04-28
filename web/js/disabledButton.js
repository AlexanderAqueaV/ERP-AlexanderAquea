function disabledButtonAdd() {
    if (document.formAdd.btnAdd.disabled == false) {        
        document.getElementById("formAdd").submit();
        document.formAdd.btnAdd.disabled = true;
        document.formAdd.btn1.hidden = true;
        document.formAdd.btn2.hidden = false;
        
    }
}

function disabledButtonUpdate() {
    if (document.formUpdate.btnUpdate.disabled == false) {
        document.getElementById("formUpdate").submit();
        document.formUpdate.btnUpdate.disabled = true;
        document.formUpdate.btn1.hidden = true;
        document.formUpdate.btn2.hidden = false;
    }
}