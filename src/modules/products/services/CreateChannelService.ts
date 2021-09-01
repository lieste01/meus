import AppError from '@shared/errors/AppError';
import logger from '@shared/Log/customLog';
import { getCustomRepository } from 'typeorm';
import Channel from '../typeorm/entities/Channel';
import { ChannelRepository } from '../typeorm/repositories/ChannelRepository';
import { ChannelTypeRepository } from '../typeorm/repositories/ChannelTypeRepository';
interface IRequest {
  name: string;
  channelTypeUuid: string;
  description: string;
  auction: number;
  config: string;
}

class CreatechannelService {
  public async execute({
    name,
    channelTypeUuid,
    description,
    auction,
    config,
  }: IRequest): Promise<Channel> {
    const channelRepository = getCustomRepository(ChannelRepository);
    const channelTypeRepository = await getCustomRepository(
      ChannelTypeRepository,
    );

    //Retorna a Chave
    const channelTypeExists = await channelTypeRepository.findByUuid(
      channelTypeUuid,
    );

    if (!channelTypeExists) {
      throw new AppError(`ChannelType not found: ${channelTypeUuid}`, 404);
    }

    const channelNew = new Channel();

    const data = new Date();
    const updated = new Date();

    channelNew.name = name;
    channelNew.channelTypeUuid = channelTypeUuid;
    channelNew.description = description;
    channelNew.auction = auction;
    channelNew.config = config;
    channelNew.createdAt = data;
    channelNew.updatedAt = updated;

    await channelRepository.save(channelNew);

    return channelNew;
  }
}

export default CreatechannelService;
