import express from 'express';

const app = express();

const port = 80 || process.env.PORT;

app.get('/',(req,res) => {
    res
      .status(200)
      .json({
          success: true,
          message: 'Hello from svc2'
      })
})

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
})