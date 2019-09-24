import React from 'react';

class NewTranslation extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            input: props.translation.input,
            output: props.translation.output
        };
        this.handleInputChange = this.handleInputChange.bind(this)
    }

    handleInputChange(e){
        this.setState({input: e.target.value})
    }

    render(){
        return(
            <div>
                <label>Text to translate</label>
                <input
                    type="text"
                    name="translation[input]"
                    value={this.state.input}
                    onChange={this.handleInputChange}
                />
                <input type="submit" value="Add Translation" />
            </div>
        );
    }
}

export default NewTranslation;