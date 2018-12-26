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
        .then(this.load());
    }
  }
}
