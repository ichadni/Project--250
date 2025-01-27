document.querySelector('#push').onclick = function () {
    const taskInput = document.querySelector('#newtask input');
    const tasksContainer = document.querySelector('#tasks');

    if (taskInput.value.trim().length === 0) {
        alert('Kindly Enter Task Name!');
        return;
    }

    const task = document.createElement('div');
    task.classList.add('task');

    const taskName = document.createElement('span');
    taskName.textContent = taskInput.value;

    const deleteBtn = document.createElement('button');
    deleteBtn.innerHTML = '<i class="far fa-trash-alt"></i>';
    deleteBtn.onclick = function () {
        this.parentElement.remove();
    };

    task.appendChild(taskName);
    task.appendChild(deleteBtn);
    tasksContainer.appendChild(task);

    taskInput.value = '';
};
