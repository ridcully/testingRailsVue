import axios from 'axios'

let api = '/api/v1/notes/'


export default {
  list: [],

  load() {
    axios.get(api + '?' + Math.random().toString())
      .then(response => {
        this.list = response.data.payload;
      });
  },

  update(index) {
    // Check if we have an existing entry
    if (this.list[index].created_at) {
      // Update
      axios.put(api + this.list[index].id.toString(), this.list[index])
        .then(response => {
          this.list[index].dirty = false;
        });
    } else {
      // Post new entry
      axios.post(api, this.list[index])
        .then(response => {
          // Replace existing entry with response from rails. This will
          // update the fields id, dirty, created_at and modified_at which
          // are not editable.
          this.list[index] = response.data.payload
        })
        .catch(error => {
          // This might need to be handled correct.
          alert('Failed')
        });
    }
  },

  delete(index) {
    // Check if we have an existing entry
    if (this.list[index].created_at) {
      axios.delete(api + this.list[index].id.toString())
        .catch(error => {
          // This might need to be handled correct.
          alert('Failed')
        });
    }
    this.list.splice(index, 1);
  }
}
