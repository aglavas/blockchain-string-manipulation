<template>
  <div id="app">
     <div class="container">
      <h1 class="text-center">String manipulation</h1>
      <div class="row">
        <div class="col-sm-12">
          <h2>Length</h2>
          <div class="form-group">
            <label for="string-length">String</label>
            <input v-model="input.length" type="text" class="form-control" id="string-length" />
          </div>
          <br>
          <button @click="calculateLength" class="btn btn-primary">Submit</button>
          <br>
          <p class="h1">{{ results.length }}</p>
        </div>
      </div>
      <br />
      <div class="row">
        <div class="col-sm-12">
          <h2>Concatenate</h2>
            <div class="form-group">
              <label for="string1">String 1</label>
              <input v-model="input.concat.str1" type="text" class="form-control" id="string1" />
            </div>
            <div class="form-group">
              <label for="string2">String 2</label>
              <input v-model="input.concat.str2" type="text" class="form-control" id="string2" />
            </div>
            <br>
            <button @click="concat" class="btn btn-primary">Submit</button>
            <p class="h1">{{ results.concat }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import StringMaster from '../../build/contracts/StringMaster.json';
import { getWeb3 } from './utils.js';
export default {
  name: 'App',
  components: {
    
  },
  data() {
    return {
      web3: null,
      contract: null,
      input: {
        length: null,
        concat: {
          str1: null,
          str2: null
        }
      },
      results: {
        length: null,
        concat: null
      }
    }
  },
  async mounted() {
    const web3 = await getWeb3();
    const networkId = await web3.eth.net.getId();
    const deployedNetwork = StringMaster.networks[networkId];
    const contract = new web3.eth.Contract(
      StringMaster.abi,
      deployedNetwork && deployedNetwork.address,
    );
    this.web3 = web3;
    this.contract = contract;
  },
  methods: {
    async calculateLength() {
      if (this.input.length) {
        this.results.length = await this.contract.methods.length(this.input.length).call();
      }
    },
    async concat() {
      if (this.input.concat.str1 && this.input.concat.str2) {
        this.results.concat = await this.contract.methods.concatenate(this.input.concat.str1, this.input.concat.str2).call();
      }
    }
  }
  
}
</script>