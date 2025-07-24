import express from 'express';
import { PrismaClient } from "../generated";

const app = express();
const prismaClient = new PrismaClient();


app.get('/', async (req, res) => {
    const user = await prismaClient.user.findMany();
    res.json({
        user
    })
})

app.post('/post', async (req, res) => {
    const user = await prismaClient.user.create({
        data:{
            username: Math.random.toString(),
            password: Math.random.toString()
        }
    })
    res.json({
        user
    })
})

app.listen(3000);